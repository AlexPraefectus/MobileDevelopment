## Programming assignment 4

Deletion via swippe gesture - problem with deletion of search results - introduced autogenerated uuid for each movie to have ability to compare them.
When deleting in search mode - we delete from both arrays: filtered and all and then reload table data (because tableView.deleteRow was throwing errors)

Details view - troubles with layout - scrollview was resizing horizontally and long texts were breaking layout + title (centered) was moved out of sight.
Solution: introduced widthAncors (scrollview's width - paddings) for each of subview and scrollview stopped to break layout.

Add Movie view - no problems but took a long time to cope with all segues logic and concepts.
