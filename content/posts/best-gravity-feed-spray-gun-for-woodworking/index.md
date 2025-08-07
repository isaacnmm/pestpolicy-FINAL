import os
import re

# --- CONFIGURATION ---
POSTS_DIR = r"C:\My Hugo Sites\pestpolicy-hugo2XX\content\posts"
DRY_RUN = True          # CRITICAL: Set to False to apply changes after reviewing.
MAX_LINKS_TO_KEEP = 3   # The maximum number of internal links you want to keep per article.
YOUR_DOMAIN = "pestpolicy.com" # Your website's domain to identify absolute internal links.

# --- HELPER FUNCTIONS ---

def parse_front_matter_and_body(content):
    """Parses the front matter and body from markdown content."""
    match = re.match(r'---\s*\n(.*?)\n---\s*\n(.*)', content, re.DOTALL)
    if match: return match.group(1), match.group(2)
    return None, content

def get_front_matter_list(fm_str, key):
    """Extracts a list of tags or categories from front matter."""
    match = re.search(rf'^{key}:\s*(\[.*\]|\n(?:\s*-\s*.*\n?)+)', fm_str, re.MULTILINE | re.IGNORECASE)
    if not match: return []
    items = re.findall(r'-\s*(.*?)\s*$', match.group(0), re.MULTILINE)
    return [item.strip().strip("'\"") for item in items]

def is_protected_link(url, domain):
    """A link is protected if it's NOT an internal link (relative or absolute to your domain)."""
    is_relative_internal = url.startswith('/posts/')
    is_absolute_internal = domain in url
    is_amazon = 'amazon.com' in url or 'amzn.to' in url
    
    # An internal link is NOT protected. Amazon links ARE protected. Other external links ARE protected.
    if is_amazon:
        return True
    if is_relative_internal or is_absolute_internal:
        return False
    return True # It's a true external link like epa.gov

def build_detailed_site_map(posts_dir):
    """Creates a map of all posts with their slugs and tags for relevance scoring."""
    site_map = {}
    for dirpath, _, filenames in os.walk(posts_dir):
        if "index.md" in filenames:
            slug = os.path.basename(dirpath)
            try:
                with open(os.path.join(dirpath, "index.md"), 'r', encoding='utf-8', errors='ignore') as f:
                    fm_str, _ = parse_front_matter_and_body(f.read())
                    if fm_str: site_map[slug] = {'tags': set(get_front_matter_list(fm_str, 'tags'))}
            except Exception: continue
    return site_map

# --- MAIN CLEANING FUNCTION ---

def prune_irrelevant_links_final(body, source_slug, site_map, max_to_keep, domain):
    """
    Final, corrected version. Correctly identifies all internal link types,
    counts them, and then prunes the most irrelevant if over the limit.
    """
    all_links_matches = list(re.finditer(r'(\[(.*?)\]\((.*?)\))', body))
    
    candidate_links = []
    # First, identify all internal links that are candidates for removal
    for match in all_links_matches:
        if not is_protected_link(match.group(3), domain):
            candidate_links.append(match)
            
    # ONLY if the number of candidates is over the limit, proceed
    if len(candidate_links) > max_to_keep:
        scored_links_to_prune = []
        for match in candidate_links:
            link_markdown = match.group(1)
            anchor_text = match.group(2)
            url = match.group(3)

            # Extract destination slug from URL: handles both relative and absolute
            dest_slug_match = re.search(r'/([^/]+)/?$', url)
            if not dest_slug_match: continue
            dest_slug = dest_slug_match.group(1)
            
            # Calculate relevance score
            source_tags = site_map.get(source_slug, {}).get('tags', set())
            dest_tags = site_map.get(dest_slug, {}).get('tags', set())
            relevance_score = len(source_tags.intersection(dest_tags))
            
            scored_links_to_prune.append({'markdown': link_markdown, 'text': anchor_text, 'score': relevance_score})

        # Sort by relevance score, lowest first, to target the worst links
        scored_links_to_prune.sort(key=lambda x: x['score'])
        
        num_to_remove = len(scored_links_to_prune) - max_to_keep
        links_to_remove = scored_links_to_prune[:num_to_remove]
        
        new_body = body
        report_lines = []
        for link_info in links_to_remove:
            new_body = new_body.replace(link_info['markdown'], link_info['text'], 1)
            report_lines.append(f"Unlinked '{link_info['text']}' (Score: {link_info['score']})")

        return new_body, report_lines

    return body, []

# --- MAIN SCRIPT ---

def smart_prune_final():
    """Main function using the fully corrected logic."""
    print("--- Phase 1: Building site intelligence map ---")
    site_map = build_detailed_site_map(POSTS_DIR)
    print(f"Site map built with {len(site_map)} posts.\n")
    
    print(f"--- Phase 2: Scanning for articles with more than {MAX_LINKS_TO_KEEP} internal links ---")
    total_modified_count = 0
    
    for dirpath, _, filenames in os.walk(POSTS_DIR):
        if "index.md" in filenames:
            markdown_path = os.path.join(dirpath, "index.md")
            source_slug = os.path.basename(dirpath)
            try:
                with open(markdown_path, 'r', encoding='utf-8', errors='ignore') as f:
                    original_content = f.read()

                front_matter, body = parse_front_matter_and_body(original_content)
                if not body: continue

                new_body, report_lines = prune_irrelevant_links_final(body, source_slug, site_map, MAX_LINKS_TO_KEEP, YOUR_DOMAIN)
                
                if report_lines:
                    total_modified_count += 1
                    print(f"--- Planning to clean: {source_slug}")
                    for line in report_lines:
                        print(f"  -> {line}")

                    if not DRY_RUN:
                        new_content = '---\n' + front_matter.strip() + '\n---\n' + new_body
                        with open(markdown_path, 'w', encoding='utf-8') as f:
                            f.write(new_content)
            
            except Exception as e:
                print(f"  *** ERROR processing file {markdown_path}: {e} ***")

    print("\n--- SCAN COMPLETE ---")
    if DRY_RUN:
        print("--- DRY RUN COMPLETE ---")
        print(f"Planned to clean irrelevant links from {total_modified_count} articles.")
    else:
        print("--- LINK CLEANING COMPLETE ---")
        print(f"Successfully cleaned links from {total_modified_count} articles.")

if __name__ == "__main__":
    smart_prune_final()