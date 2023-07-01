# Cosmic Explorer

This is a Flutter application that fetches and displays beautiful images from the Astronomy Picture of the Day API. The main screen of the app displays a set of images provided by the API.

## Contributors

- [Edilson Morais Brito](https://github.com/ed-morais)
- [Tiago Silva Carvalho](https://github.com/TSCTiago)
- [Francisco Mendes Magalhães Filho](https://github.com/FranciscoMends)

## Features

1. **Dynamic Image Display:** The number of images displayed on the main screen (1 ≤ N ≤ 20) is a system parameter that can be changed by the user during the execution of the application through access to a settings page.

2. **Image Information:** For each image shown on the main screen, its title and date are displayed.

3. **Image Update Option:** There is a visual option to update the images on the screen.

4. **Pull-to-refresh:** In addition to the update option, the main screen also implements the "pull-to-refresh" feature to select a new set of images.

5. **Image Details:** When a user taps on an image, they are led to a new detail screen that presents the following metadata of the image: image, title, date, explanation, and copyright.

6. **Image Display:** The image on the detail screen is expanded to the limit of the horizontal resolution of the screen, maintaining the original aspect of the image (without distortion).

7. **Error Handling:** If some of the image fields (metadata) are not provided by the API, the application handles this appropriately.

8. **Long Data Processing:** Long data are properly processed so that they can be scrolled on the screen. Scrolling is implemented in a way that the user doesn't need many iterations to view all the image fields (metadata).

9. **Loading Indicator:** The waiting time between a request and the receipt of data from the API is signaled by displaying a spinner on the screen.

10. **Error Notification:** All possible API communication errors are anticipated by the application and appropriately notified to the user through non-technical messages.

11. **Team Information:** The application has an option to display the data of the team members.

12. **Coding Standards:** The project's coding follows the principles of Effective Dart style.


## Installation

Clone the repository and run `flutter pub get` to fetch the dependencies. Then, run `flutter run` to start the application.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

MIT
