#!/bin/bash

# This script generates an index.html file that lists all .usdz files
# found in the current directory, making them clickable download links.
# It also ensures a .nojekyll file is present for GitHub Pages.

echo "--- Generating index.html and .nojekyll file ---"

# Create or ensure .nojekyll exists for GitHub Pages
touch .nojekyll
echo ".nojekyll file ensured for GitHub Pages."

# Start building the index.html content
INDEX_HTML_CONTENT='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Downloadable Files</title>
    <!-- Tailwind CSS CDN for easy styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for the Inter font and basic body styling */
        body {
            font-family: "Inter", sans-serif;
            background-color: #f0f4f8; /* Light blue-gray background */
            color: #334155; /* Dark gray text */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            max-width: 90%; /* Fluid width for responsiveness */
            margin: 0 auto;
            padding: 1.5rem;
        }
        /* Ensure images are responsive (though not used in this version, good practice) */
        img {
            max-width: 100%;
            height: auto;
            display: block; /* Remove extra space below images */
        }
    </style>
</head>
<body class="antialiased">
    <!-- Header Section -->
    <header class="bg-blue-600 text-white shadow-lg py-4">
        <div class="container flex justify-between items-center">
            <h1 class="text-3xl font-bold rounded-md px-3 py-1 bg-blue-700">My Files</h1>
            <nav>
                <ul class="flex space-x-6">
                    <li><a href="#" class="hover:text-blue-200 transition duration-300 rounded-md px-3 py-2 hover:bg-blue-700">Home</a></li>
                    <li><a href="#" class="hover:text-blue-200 transition duration-300 rounded-md px-3 py-2 hover:bg-blue-700">About</a></li>
                    <li><a href="#" class="hover:text-blue-200 transition duration-300 rounded-md px-3 py-2 hover:bg-blue-700">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content Section -->
    <main class="flex-grow py-8">
        <div class="container bg-white p-8 rounded-xl shadow-lg">
            <section class="mb-8">
                <h2 class="text-4xl font-extrabold text-blue-700 mb-4 rounded-md bg-blue-50 px-4 py-2 inline-block">Available Files for Download</h2>
                <p class="text-lg leading-relaxed text-gray-700 mb-6">
                    Click on any of the links below to download the corresponding file.
                </p>
                <ul class="space-y-3">'

# Find all .usdz files in the current directory, sort them, and add to HTML
for filename in $(ls -1 *.usdz 2>/dev/null | sort); do
    # Remove the .usdz extension for display text
    display_name="${filename%.usdz}"
    # Capitalize the first letter of each word for better readability
    display_name=$(echo "$display_name" | sed -E 's/\b([a-z])/\U\1/g')

    INDEX_HTML_CONTENT+="
                    <li>
                        <a href=\"./${filename}\" download=\"${filename}\" class=\"text-blue-600 hover:text-blue-800 font-semibold text-lg transition duration-300 ease-in-out transform hover:scale-105 inline-flex items-center\">
                            <svg class=\"w-5 h-5 mr-2\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M13 7l5 5m0 0l-5 5m5-5H6\"></path></svg>
                            Download ${display_name} File (${filename})
                        </a>
                    </li>"
done

# Close the HTML structure
INDEX_HTML_CONTENT+='
                </ul>
            </section>
        </div>
    </main>

    <!-- Footer Section -->
    <footer class="bg-gray-800 text-white py-6 mt-auto">
        <div class="container text-center">
            <p>&copy; 2025 My Files. All rights reserved.</p>
            <p class="text-sm mt-2">Hosted with &hearts; on GitHub Pages.</p>
        </div>
    </footer>
</body>
</html>'

# Write the content to index.html
echo "$INDEX_HTML_CONTENT" > index.html
echo "index.html has been generated with links to all .usdz files."
echo "--- Generation Complete ---"

