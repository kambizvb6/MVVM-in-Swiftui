SwiftUI MVVM User Profile View
Overview:

<p align="center">
  <img width="200" align="center" src="https://github.com/kambizvb6/Smooth-Icon-Transition/blob/main/SmoothI-Icon.gif" alt="demo"/>
</p>

This repository contains a SwiftUI project implementing a User Profile View using the MVVM (Model-View-ViewModel) architecture. The User Profile View displays a list of users with their profile images, names, checkmark badges, follower counts, and supports searching and deletion functionalities.
Key Components:

    UserProfileView:
        A SwiftUI View responsible for displaying the user profile list.
        Utilizes the MVVM architecture with a dedicated UserViewModel for managing user data.
        Includes a search bar for filtering users based on their usernames.
        Implements a dynamic list with user information and supports swipe-to-delete functionality.

    UserViewModel:
        An ObservableObject class serving as the ViewModel for the UserProfileView.
        Manages the user data and loading state.
        Fetches user data asynchronously upon initialization.
        Provides methods for deleting users from the list.

    UserModel:
        Represents the data model for a user, including user image, name, full name, and follower count.

Additional Features:

    Loading Indicator:
        Displays a loading indicator while user data is being fetched.

    Tap Gesture:
        Prints the username to the console when a user cell is tapped.
