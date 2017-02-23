//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/////The NSFileManager class contains a class method named defaultManager that is used to obtain a reference to the application’s default file manager instance:
let filemgr = NSFileManager.defaultManager()

////When an application first loads, its current working directory is the application’s root directory, represented by a / character. The current working directory may be identified at any time by accessing the currentDirectoryPath property of the file manager object. For example, the following code fragment identifies the current working directory:
let currentPath = filemgr.currentDirectoryPath

////// Each iOS application on a device has its own private Documents and tmp directories into which it is permitted to read and write data. Because the location of these directories is different for each application the only way to find the correct path is to ask iOS. In fact, the exact location will also differ depending on whether the application is running on a physical iPhone or iPad device or in the iOS Simulator.
let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)

/////// When executed, the above code will assign the path to the Documents directory to the docsDir constant.
let docsDir = dirPaths[0] as String

/////// When executed within the iOS Simulator environment, the path returned will take the form of:
/////// Where <user name> is the name of the user currently logged into the Mac OS X system on which the simulator is running, <device id> is the unique ID of the device on which the app is running and <app id> is the unique ID of the app, for example:06A3AEBA-8C34-476E-937F-A27BDD2E450A

//  /Users/<user name>/Library/Developer/CoreSimulator/Devices/<device id>/data/Containers/Data/Application/<app id>/Documents

////// When executed on a physical iOS device, however, the path returned by the function call will take the following form:

//  /var/mobile/Containers/Data/Application/<app id>/Documents

/////// Once executed, the string object referenced by tmpDir will contain the path to the temporary directory for the application. The path to the current application’s temporary directory may be ascertained with a call to the NSTemporaryDirectory C function
let tmpDir = NSTemporaryDirectory() as String

/////// Having identified the path to the application’s document or temporary directory the chances are good that you will need to make that directory the current working directory. The current working directory of a running iOS application can be changed with a call to the changeCurrentDirectoryPath method of an NSFileManager instance. The destination directory path is passed as an argument to the instance method in the form of a String object. Note that this method returns a Boolean true or false result to indicate if the requested directory change was successful or not. A failure result typically indicates either that the specified directory does not exist, or that the application lacks the appropriate access permissions

let filemgr1 = NSFileManager.defaultManager()
let dirPaths1 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
let docsDir1 = dirPaths1[0] as String

///////Checks if directory path has been changed successfully.. The path to the Documents directory is identified and then used as an argument to the changeCurrentDirectoryPath method of the file manager object to change the current working directory to that location.
if filemgr1.changeCurrentDirectoryPath(docsDir1) {
    // Success
}
else {
// Failure 
}

////////////////////////////// Creating a New Directory
/////A new directory on an iOS device is created using the createDirectoryAtPath instance method of the NSFileManager class, once again passing through the pathname of the new directory as an argument and returning a Boolean success or failure result. The second argument to this method defines whether any intermediate directory levels should be created automatically. For example, if we wanted to create a directory with the path /var/mobile/Containers/Data/Application/<app id>/Documents/mydata/maps and the mydata subdirectory does not yet exist, setting the withIntermediateDirectories argument to true will cause this directory to be created automatically before then creating the maps sub-directory within it. If this argument is set to false, then the attempt to create the directory will fail because mydata does not already exist and we have not given permission for it to be created on our behalf. This method also takes additional arguments in the form of a set of attributes for the new directory. Specifying nil will use the default attributes. The final argument provides the option to reference an NSError object to contain error information in the event of a failure. If this is not required, nil may be specified for this argument. The following code fragment identifies the documents directory and creates a new sub-directory named data in that directory:

let filemgr2 = NSFileManager.defaultManager()
let dirPaths2 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
let docsDir2 = dirPaths2[0] as String
let newDir2 = docsDir2.stringByAppendingPathComponent("data")
var error: NSError?
if !filemgr2.createDirectoryAtPath(newDir2, withIntermediateDirectories: true,
                                  attributes: nil, error: &error) {
    print("Failed to create dir: \(error!.localizedDescription)")

}

///////////////////////////////////////Deleting a Directory
/////An existing directory may be removed from the file system using the removeItemAtPath method, passing through the path of the directory to be removed as an argument. For example, to remove the data directory created in the preceding example we might write the following code:
var error: NSError?
if !filemgr.removeItemAtPath(newDir, error: &error) {
    print("Failed to delete directory:\(error!.localizedDescription)")
}

///////////////////////////////////////Listing the Contents of a Directory
///A listing of the files contained within a specified directory can be obtained using the directoryContentsAtPath method. This method takes the directory pathname as an argument and returns an array object containing the names of the files and sub-directories in that directory. The following example obtains a listing of the contents of the root directory (/) and displays each item in the Xcode console panel during execution:

let filemgr = NSFileManager.defaultManager()
let filelist = filemgr.contentsOfDirectoryAtPath("/", error: &error)
for filename in filelist! {
    print(filename)
}

///////////////////////////Getting the Attributes of a File or Directory
/*
The attributes of a file or directory may be obtained using the attributesOfItemAtPath method. This takes as arguments the path of the directory and an optional NSError object into which information about any errors will be placed (may be specified as nil if this information is not required). The results are returned in the form of an NSDictionary dictionary object. The keys for this dictionary are as follows:
NSFileType NSFileTypeDirectory NSFileTypeRegular NSFileTypeSymbolicLink NSFileTypeSocket NSFileTypeCharacterSpecial NSFileTypeBlockSpecial NSFileTypeUnknown NSFileSize NSFileModificationDate NSFileReferenceCount NSFileDeviceIdentifier NSFileOwnerAccountName NSFileGroupOwnerAccountName NSFilePosixPermissions NSFileSystemNumber NSFileSystemFileNumber NSFileExtensionHidden NSFileHFSCreatorCode NSFileHFSTypeCode NSFileImmutable NSFileAppendOnly NSFileCreationDate NSFileOwnerAccountID NSFileGroupOwnerAccountID
For example, we can extract the file type for the /Applications directory using the following code excerpt:
 */
let filemgr = NSFileManager.defaultManager()
var error: NSError?
let attribs: NSDictionary? = filemgr.attributesOfItemAtPath(
    "/Applications", error: &error)
if let fileattribs = attribs {
    let type = fileattribs["NSFileType"] as String
    ////When executed, results similar to the following output will appear in the Xcode console:
    File type NSFileTypeDirectory
    print("File type \(type)")
}

///////////////////////////////////////////////////QUICK RECAP///////////////

//Once a reference to the file manager object of the app has been obtained it can be used to perform some basic file handling tasks.
let filemgr = NSFileManager.defaultManager()

///////////////////////////// Checking for the Existence of a File

//The NSFileManager class contains an instance method named fileExistsAtPath which checks whether a specified file already exists. The method takes as an argument an NSString object containing the path to the file in question and returns a Boolean value indicating the presence or otherwise of the specified file.
    if filemgr.fileExistsAtPath("/Applications") {
        print("File exists")
}
    else {
    println("File not found")
}

/////////////////////////////  Comparing the Contents of Two Files

// The contents of two files may be compared for equality using the contentsEqualAtPath method. This method takes as arguments the paths to the two files to be compared and returns a Boolean result to indicate whether the file contents match:
if filemgr.contentsEqualAtPath(filepath1, andPath: filepath2) {
    print("File contents match")
}
else {
    print("File contents do not match")
}

////////////////////////// Checking if a File is Readable/Writable/Executable/Deletable

// The quickest way to find out if your program has a particular access permission is to use the isReadableFileAtPath, isWritableFileAtPath, isExecutableFileAtPath and isDeletableFileAtPath methods. Each method takes a single argument in the form of the path to the file to be checked and returns a Boolean result. For example, the following code excerpt checks to find out if a file is writable. To check for other access permissions simply substitute the corresponding method name in place of isWritableFileAtPath in the above example.
    if filemgr.isWritableFileAtPath(filepath1) {
        print("File is writable")
}
    else {
    print("File is read-only")
}

///////////////////////////////  Moving/Renaming a File
// A file may be renamed (assuming adequate permissions) using the moveItemAtPath method. This method returns a Boolean result and takes as arguments the pathname for the file to be moved, the destination path and an optional NSError object into which information describing any errors encountered during the operation will be placed. If no error description information is required, this argument may be set to nil. Note that if the destination file path already exists this operation will fail.
var error: NSError?
if filemgr.moveItemAtPath(filepath1, toPath: filepath2, error: &error) {
    print("Move successful")
}
else {
    print("Moved failed with error: \(error!.localizedDescription)")
}

/////////////////////////////////  Copying a File
// File copying can be achieved using the copyItemAtPath method. As with the move method, this takes as arguments the source and destination pathnames and an optional NSError object. Success of the operation is indicated by the returned Boolean value:
var error: NSError?
if filemgr.copyItemAtPath(filepath1, toPath: filepath2, error: &error) {
    print("Copy successful")
}
else {
    print("Copy failed with error: \(error!.localizedDescription)")
}

//////////////////////////////// Removing a File
// The removeItemAtPath method removes the specified file from the file system. The method takes as arguments the pathname of the file to be removed and an optional NSError object. The success of the operation is, as usual, reported in the form of a Boolean return value:
var error: NSError?
if filemgr.removeItemAtPath(filepath1, error: &error) {
    print("Remove successful")
}
else {
    print("Remove failed: \(error!.localizedDescription)")
}

//////////////////////////////// Creating a Symbolic Link
// A symbolic link to a particular file may be created using the createSymbolicLinkAtPath method. This takes as arguments the path of the symbolic link, the path to the file to which the link is to refer and an optional NSError object:
var error: NSError?
if filemgr.createSymbolicLinkAtPath(filepath2, withDestinationPath: filepath1, error: &error) {
    print("Link successful")
}
else
{
    print("Link failed: \(error!.localizedDescription)")
}

/////////////////////////////////// The contents of a file may be read and stored in an NSData object through the use of the contentsAtPath method
let databuffer = filemgr.contentsAtPath(filepath1)

/////////////////////////////////// Having stored the contents of a file in an NSData object that data may subsequently be written out to a new file using the createFileAtPath method. In this example we have essentially copied the contents from an existing file to a new file. This, however, gives us no control over how much data is to be read or written and does not allow us to append data to the end of an existing file.
filemgr.createFileAtPath(filepath2, contents: databuffer, attributes: nil)

////////////////////////////// Working with Files using the NSFileHandle Class
// The NSFileHandle class provides a range of methods designed to provide a more advanced mechanism for working with files. In addition to files, this class can also be used for working with devices and network sockets. In the following sections we will look at some of the more common uses for this class.

////////////////////// Creating an NSFileHandle Object
// An NSFileHandle object can be created when opening a file for reading, writing or updating (in other words both reading and writing). Having opened a file, it must subsequently be closed when we have finished working with it using the closeFile method. If an attempt to open a file fails, for example because an attempt is made to open a non-existent file for reading, these methods return nil. For example, the following code excerpt opens a file for reading and then closes it without actually doing anything to the file
let file: NSFileHandle? = NSFileHandle(forReadingAtPath: filepath1)
if file == nil {
    print("File open failed")
}
else {
    file?.closeFile()
}

///////////////////////////////// NSFileHandle File Offsets and Seeking
//NSFileHandle objects maintain a pointer to the current position in a file. This is referred to as the offset. When a file is first opened the offset is set to 0 (the beginning of the file). This means that any read or write operations performed using the NSFileHandle instance methods will take place at offset 0 in the file. To perform operations at different locations in a file (for example to append data to the end of the file) it is first necessary to seek to the required offset. For example to move the current offset to the end of the file, use the seekToEndOfFile method. Alternatively, seekToFileOffset allows you to specify the precise location in the file to which the offset is to be positioned. Finally, the current offset may be identified using the offsetInFile method. In order to accommodate large files, the offset is stored in the form of an unsigned 64-bit integer. The following example opens a file for reading and then performs a number of method calls to move the offset to different positions, outputting the current offset after each move:

let file: NSFileHandle? = NSFileHandle(forReadingAtPath: filepath1)
if file == nil {
    println("File open failed")
}
else
{
    // Offset pointer at the beginning of the file
    print("Offset = \(file?.offsetInFile)")
    
    // Offset pointer at the end of the file
    file?.seekToEndOfFile()
    print("Offset = \(file?.offsetInFile)")
    
    // Offset pointer at the point 30 of the file
    file?.seekToFileOffset(30)
    print("Offset = \(file?.offsetInFile)")
    
    // Close file
    file?.closeFile()
}


///////////////////////////////// Reading Data from a File
// Once a file has been opened and assigned a file handle, the contents of that file may be read from the current offset position. The readDataOfLength method reads a specified number of bytes of data from the file starting at the current offset. For example, the following code reads 5 bytes of data from offset 10 in a file. The data read is returned encapsulated in an NSData object

let file: NSFileHandle? = NSFileHandle(forReadingAtPath: filepath1)
if file == nil {
    print("File open failed")
}
else
{
    // Offset point starts at point 10
    file?.seekToFileOffset(10)
    
    // Reads 5 bytes of data
    let databuffer = file?.readDataOfLength(5)
    
    file?.closeFile()
// Alternatively, the readDataToEndOfFile method will read all the data in the file starting at the current offset and ending at the end of the file.
}

////////////////////////////// Writing Data to a File
// The writeData method writes the data contained in an NSData object to the file starting at the location of the offset. Note that this does not insert data but rather overwrites any existing data in the file at the corresponding location. To see this in action, let’s assume the existence of a file named quickfox.txt containing the following text: The quick brown fox jumped over the lazy dog Next, we will write code that opens the file for updating, seeks to position 10 and then writes some data at that location
let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: filepath1)
if file == nil {
    print("File open failed")
}
else {
    let data = ("black dog" as
        NSString).dataUsingEncoding(NSUTF8StringEncoding)
    // Start writing data at offset point 10
    file?.seekToFileOffset(10)
    
    // Write 'data' to file
    file?.writeData(data!)
    file?.closeFile()
    // When the above program is compiled and executed the contents of the quickfox.txt file will have changed to:
    // The quick black dog jumped over the lazy dog
}

/////////////////////////////// Truncating a File
// A file may be truncated at the specified offset using the truncateFileAtOffset method. To delete the entire contents of a file, specify an offset of 0 when calling this method:
let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: filepath1)
if file == nil {
    print("File open failed")
}
else {
    file?.truncateFileAtOffset(0)
    file?.closeFile()
}












