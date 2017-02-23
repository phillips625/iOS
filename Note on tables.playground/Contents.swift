//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// FOR SETTING FONT, USE "preferredFontForTextStyle" METHOD E.G UIFont.preferredFontForTextStyle(<#T##style: String##String#>). E.G 
/*
· UIFontTextStyleHeadline
· UIFontTextStyleSubheadline
· UIFontTextStyleBody
· UIFontTextStyleFootnote
· UIFontTextStyleCaption1
· UIFontTextStyleCaption2
 */

////////////////////////SETS DYNAMIC TYPE FONT STYLE USING HEADLINE FONT STYLE
//E.g cell.myLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

/////4 DIFFERENT TYPES OF CELL STYLES
/*
1   UITableViewCellStyleDefault – only the labelText in black and left aligned.
2   UITableViewCellStyleSubtitle – labelText in black and left aligned with the detailLabelText positioned beneath it in a smaller font using a gray foreground.
3   UITableViewCellStyleValue1 – labelText in black left aligned and the smaller detailLabelText in
    blue, on the same line and right aligned.
4   UITableViewCellStyleValue2 – labelText in blue on left side of cell, right aligned and detailedLabelText on right of cell, left aligned and black.
 */

///////CREATING TABLE CELLS USING "registerClass" METHOD OF UITABLEVIEW OBJECT
//self.tableView.registerClass (AttractionTableViewCell.self, forCellReuseIdentifier: "MYTableCell")

///////FOR CELL CONTAINED IN IB (NIB file), use registerNib method

///////IT IS NOT NECESSARY TO REGISTER CELLS THAT HAS BEEN BUILT IN IB, OTHERWISE IT WOULD NOT APPEAR ON THE SCREEN WHEN YOU RUN IT. 

///////cellForRowAtIndexPath IS CALLED WHEN THE TABLE VIEW IS LOADED IN ORDER TO PASS DATA FROM THE DATA SOURCE. This method will then call the dequeueReusableCellWithReuseIdentifier method of the table view object, passing through both the index path and the reuse ID assigned to the cell class when it was registered, to find out if there is a reusable cell object in the queue that can be used for this new cell.

//////////CELL CUSTOMIZATION
//As the user scrolls through the table view, some cells will move out of the visible frame. When this happens, the table view places them on the reuse queue. As cells are moving out of view, new ones are likely to be coming into view. For each cell moving into the view area, the table view will call cellForRowAtIndexPath. This time, however, when a call to the
    //dequeueReusableCellWithReuseIdentifier method is made, it is most likely that an existing cell object will be returned from the reuse queue, thereby avoiding the necessity to create a new object.
/*
override func tableView (table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
{
    let cell = tableView.dequeueReusableCellWithIdentifier("MyTableCell", forIndexPath: indexPath) as MyTableViewCell
    
    //Self configuration
    return cell
}
*/






