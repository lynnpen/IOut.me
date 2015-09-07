
USE_FOLDER_AS_CATEGORY

install Markdown package and can be configured and loaded via the MD_EXTENSIONS setting.


Title: My super title
Date: 2010-12-03 10:20
Modified: 2010-12-05 19:30
Category: Python
Tags: pelican, publishing
Slug: my-super-post
Authors: Alexis Metaireau, Conan Doyle
Summary: Short version for index and feeds

This is the content of my super blog post.


If you create a folder named pages inside the content folder, all the files in it will be used to generate static pages, such as About or Contact pages. (See example filesystem layout below.)

You can use the DISPLAY_PAGES_ON_MENU setting to control whether all those pages are displayed in the primary navigation menu. (Default is True.)

If you want to exclude any pages from being linked to or listed in the menu then add a status: hidden attribute to its metadata. This is useful for things like making error pages that fit the generated theme of your site.
