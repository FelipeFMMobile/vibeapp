# MVVM Pattern
- Consider for each View, a parent class file with `ViewModel` suffix, with one `@Published` called `viewState` that controls with an enum the basic states: `idle`, `loading`, `success`, `error`. This controls the business logic of the View.
- ViewModel files need to be an `ObservableObject` and all its views need to reference it using `@StateObject` viewModel-like vars. Also include the import Combine on these files.
- ViewModel files hold data structures, network layer references, and so on.
- View files are forbidden to process any model or command without reference to a ViewModel function that does not include any View components.
- ViewModel classes cannot use any SwiftUI view component inside them, like `VStack`, `Text`, and so on.
- Inside View files, for any String that will be use to fill Text components and similar, put it in a extension of the ViewModel file with a enum called Strings and use this reference. 

# Guideline
- All SwiftUI files and classes must have the `View` suffix name.
- All ViewModel files and classes must have the `ViewModel` suffix name.

# Unit Tests
- Create a unit test file that test each function of ViewModel class  

