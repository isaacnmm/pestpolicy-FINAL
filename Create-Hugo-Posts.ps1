# ===================================================================
# Create-Hugo-Posts.ps1
#
# Creates Hugo post folders and index.md files from a list of keywords.
# ===================================================================

# --- STEP 1: CONFIGURE YOUR DETAILS ---

# Set the path to your Hugo site's content directory.
# IMPORTANT: This should be your ACTIVE site, not the archive.
$hugoContentPath = "C:\My Hugo Sites\pestpolicy-FINAL\content\posts"

# Add all the keywords for the articles you want to create.
# Use double quotes for each keyword, separated by a comma.
# --- This is the corrected block to paste into your file ---
$keywords = @(
    "why is my flea trap not catching anything",
    "where is the best place to put a flea trap",
    "are electric flea traps safe for dogs and cats",
    "do sticky flea traps actually work",
    "how to monitor flea infestation level with traps"
)
# --- STEP 2: RUN THE SCRIPT (No changes needed below this line) ---

# Check if the base content path exists
if (-not (Test-Path -Path $hugoContentPath -PathType Container)) {
    Write-Host "ERROR: The base path '$hugoContentPath' does not exist." -ForegroundColor Red
    Write-Host "Please check the path in the script and try again." -ForegroundColor Red
    exit
}

Write-Host "Starting post creation process..." -ForegroundColor Cyan
Write-Host "Base content folder: $hugoContentPath" -ForegroundColor Cyan
Write-Host "----------------------------------------------------"

# Loop through each keyword in the list
foreach ($keyword in $keywords) {

    # Sanitize the keyword to create a URL-friendly "slug"
    # 1. Convert to lowercase
    # 2. Replace any sequence of non-alphanumeric characters with a single hyphen
    # 3. Trim any leading or trailing hyphens
    $slug = $keyword.ToLower() `
        -replace '[^a-z0-9]+', '-' `
        -replace '^-|-$', ''

    # Define the full path for the new post's folder and index file
    $postFolderPath = Join-Path -Path $hugoContentPath -ChildPath $slug
    $indexPath = Join-Path -Path $postFolderPath -ChildPath "index.md"

    Write-Host "Processing Keyword: '$keyword'"
    Write-Host "  -> Slug: '$slug'"

    # Check if the post folder already exists
    if (-not (Test-Path -Path $postFolderPath)) {
        # If not, create the directory
        New-Item -Path $postFolderPath -ItemType Directory | Out-Null
        Write-Host "  -> CREATED directory: '$postFolderPath'" -ForegroundColor Green
    } else {
        Write-Host "  -> Directory already exists. Skipping folder creation." -ForegroundColor Yellow
    }

    # Check if the index.md file already exists
    if (-not (Test-Path -Path $indexPath)) {
        # Get the current date in ISO 8601 format for Hugo
        $currentDate = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"

        # Create the YAML front matter.
        # All posts are created as drafts to prevent accidental publishing.
        $frontMatter = @"
---
title: "$keyword"
date: $currentDate
draft: true
author: ""
tags: []
categories: []
---

<!-- Article content goes here. -->
"@

        # Write the front matter to the new index.md file
        $frontMatter | Set-Content -Path $indexPath
        Write-Host "  -> CREATED file: '$indexPath' with draft front matter." -ForegroundColor Green
    } else {
        Write-Host "  -> index.md already exists. Skipping file creation." -ForegroundColor Yellow
    }
    Write-Host "" # Add a blank line for readability
}

Write-Host "----------------------------------------------------"
Write-Host "Script finished. All posts have been created as drafts." -ForegroundColor Cyan