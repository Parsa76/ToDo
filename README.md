
<img width="512" alt="logo" src="https://github.com/Parsa76/ToDo/assets/63924414/875c907b-738c-4236-bf53-bd9d53d339e5">

# To-Do App 

This repository contains a To-Do app inspired by the one of principles outlined in the book 'Atomic Habits' by James Clear. The app is designed to help users organize tasks effectively and minimize procrastination by implementing a structured approach to task management.

## Features of the To-Do App


![Bild 6](https://github.com/Parsa76/ToDo/assets/63924414/f21eab5f-9f99-442f-b0e4-d5d5da5153fb)


### Architecture and Design Principles

This To-Do app is structured using the MVVM (Model-View-ViewModel) architecture, which separates the concerns of data, UI, and presentation logic. Additionally, the implementation follows the Dependency Injection design principle, facilitating loose coupling and enhancing flexibility within the app.

### Data Storage with Core Data

The app employs Core Data, Apple's framework for data management, to persistently store and manage tasks and their details locally on the user's device. Core Data ensures efficient data manipulation and provides various querying options for tasks.

### Data Synchronization with Combine Framework

The To-Do app utilizes the Combine framework, Apple's reactive programming framework, to facilitate seamless data synchronization and handle asynchronous events within the application. Combine ensures real-time updates and synchronization of tasks across different views.

### Push Notifications

The app incorporates Push Notifications to provide users with reminders and updates about their tasks. Users can receive notifications for upcoming tasks, deadline reminders.

![ezgif-1-34abe644b6](https://github.com/Parsa76/ToDo/assets/63924414/558a513a-c234-4ede-a8d4-7dd7f540a878)

### Kanban Board Functionality

The app includes a Kanban board feature built using SwiftUI, enabling users to visualize and manage tasks efficiently. Tasks are organized into columns - 'To Do,' 'Doing,' and 'Done' - aiding users in categorizing and tracking their task progress.

![kanban](https://github.com/Parsa76/ToDo/assets/63924414/243acb81-773b-4565-8bc9-d114fef6752c)


### Dark Mode and Light Mode Support

The app fully supports both Dark Mode and Light Mode to accommodate users' preferences. Whether users prefer a darker or lighter interface, the app adapts to provide a comfortable and consistent user experience.

### iPhone and iPad Support

The app is designed to support both iPhone and iPad devices, offering a responsive and consistent user experience across various screen sizes.

![Bild 7](https://github.com/Parsa76/ToDo/assets/63924414/2a2953ef-a246-4870-8916-009b3a534ad7)

## Technologies Used

- **Swift**: The app is primarily written in Swift, Apple's programming language, known for its safety, performance, and expressiveness.
- **SwiftUI**: The user interface of the app is built using SwiftUI, Apple's modern framework for building user interfaces across all Apple platforms.
- **MVVM Architecture**: The app follows the MVVM (Model-View-ViewModel) architectural pattern to maintain a separation of concerns and enhance code maintainability.
- **Dependency Injection**: Utilizes Dependency Injection to manage and provide dependencies throughout the application, ensuring flexibility and testability.

## How to Use

1. Clone this repository.
2. Follow the installation instructions in the 'Installation.md' file.
3. Run the app on your local machine.

Feel free to contribute by submitting pull requests or reporting issues.

## Credits

- The 'Atomic Habits' book by James Clear for inspiring the methodology behind this To-Do app.

## License

This project is licensed under the [MIT License](LICENSE).
