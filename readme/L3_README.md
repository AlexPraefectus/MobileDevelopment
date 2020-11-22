# Programming assignment 3

### Done:

+ model class representing movie [link](https://github.com/AlexPraefectus/MobileDevelopment/blob/main/MobileDevelopment/models/Movie.swift)
+ reader class to load saved json data [link](https://github.com/AlexPraefectus/MobileDevelopment/blob/main/MobileDevelopment/lib/JSONMovieReader.swift)
+ view controller to dynamically build layout (autolayout) [link](https://github.com/AlexPraefectus/MobileDevelopment/blob/main/MobileDevelopment/TableViewController.swift)

### Flow with problems faced:

No problems creating model representing movie

No problems reading `.json` files or setting poster images

Problems creating cells - method call was returning null
```swift
let cell = tableView.dequeueReusableCell(withIdentifier: <some_hardcoded_string>, for: indexPath) as! MovieCell;
```
Changed hardcoded string to constant (probably pointer rather than value comparison) and made it shorter than 10 symbols (saw issues with this on StackOverFlow). IDK what exactly helped but it began to work correctly.

Faced a lot of problems building layout with anchors:

+ Was binding subviews anchors to `self.<anchor>` instead of `self.contentView.<anchor>`. Cause of this, view cell did not calculate it's size correctly - layout was completely broken.
+ Forgot to disable `translatesAutoresizingMaskIntoConstraints` - layout was completely broken
+ Problems to fit long texts - subclassed label with 
```swift
class CustomLabel: UILabel {
    override var text: String? {
        didSet {
            self.numberOfLines = 0;
            self.lineBreakMode = .byWordWrapping;
            self.sizeToFit();
        }
    }
}
```
