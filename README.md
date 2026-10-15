# Mobile Programming (SE202)

Coursework and laboratory assignments for Mobile Programming with Flutter and Dart.

- Student: Jaxongir Niyazmetov
- ID: 240451

## Repository Structure

```
Mobile_Programming/
├── Lab 2/
│   ├── Section 1/
│   ├── Section 2/
│   ├── Section 3/
│   └── Section 4/
├── Lab 4/
│   ├── pubspec.yaml
│   └── lib/
│       ├── main.dart
│       ├── task1_screen.dart
│       ├── task2_screen.dart
│       ├── task3_screen.dart
│       ├── task4_screen.dart
│       ├── task5_screen.dart
│       ├── task6_screen.dart
│       ├── task7_screen.dart
│       ├── task8_screen.dart
│       ├── task9_screen.dart
│       └── task10_screen.dart
└── Lab 5/
    ├── pubspec.yaml
    └── lib/
        ├── main.dart
        ├── task_host.dart
        ├── task1_screen.dart
        ├── task2_screen.dart
        ├── task3_screen.dart
        ├── task4_screen.dart
        ├── task5_screen.dart
        └── task6_screen.dart
```

## Lab 4: Flutter Mobile Widgets

Complete implementation of the full 10-task workbook (100 pts requirement):

- **Task 1: Selection Controls** (`task1_screen.dart`)
  - SwitchListTile for dark mode toggle.
  - CheckboxListTile for terms agreement that enables the continue button.
- **Task 2: Input Fields** (`task2_screen.dart`)
  - Login form with email and password fields.
  - Obscure password toggle with show/hide icon.
  - Form validation requiring @ symbol in email.
- **Task 3: Buttons and Action Items** (`task3_screen.dart`)
  - FloatingActionButton to increment counter state.
  - OutlinedButton to reset counter back to 0.
- **Task 4: Indicators and Feedback** (`task4_screen.dart`)
  - Asynchronous simulation showing centered CircularProgressIndicator for 3 seconds.
  - SnackBar notification with an interactive undo action.
- **Task 5: Dialogs and Modals** (`task5_screen.dart`)
  - AlertDialog confirmation popup for deletion with Cancel and Delete options.
  - showModalBottomSheet action sheet containing share options.
- **Task 6: Sliders and Pickers** (`task6_screen.dart`)
  - Interactive volume Slider with dynamic percentage text.
  - Native calendar picker dialog using showDatePicker.
- **Task 7: Scrollable Collections** (`task7_screen.dart`)
  - Lazy-loaded list of 20 items using ListView.builder.
  - Dismissible swipe-to-dismiss gesture for removing items with feedback.
- **Task 8: Grid Displays** (`task8_screen.dart`)
  - 2-column image gallery layout using GridView.count with cross-axis spacing.
  - InkWell tap detection opening a full-screen preview modal dialog.
- **Task 9: Navigation Controls** (`task9_screen.dart`)
  - 3-tab layout using BottomNavigationBar for dynamic view switching.
  - Top tab interface using TabBar and TabBarView inside the AppBar.
- **Task 10: Structural Containers** (`task10_screen.dart`)
  - Information Card with header, subtitle, leading icon, and action button.
  - FAQ screen with collapsible ExpansionTile widgets.

## Lab 5: Navigation and Routing

All 6 categories of the workbook, 5 tasks each (30 tasks). Each category file holds its 5 tasks, opened from a menu. The small button at the bottom left of a running task goes back to the menu. `task_host.dart` holds that shared menu and button.

- **Task 1: Navigator push and pop** (`task1_screen.dart`)
  - Two screens, three screen chain, pushReplacement login, popUntil back to the start, canPop back button.
- **Task 2: Named routes** (`task2_screen.dart`)
  - Route table with constants, menu with four routes, onUnknownRoute 404 page, drawer with pushReplacementNamed, log out with pushNamedAndRemoveUntil.
- **Task 3: Constructor arguments** (`task3_screen.dart`)
  - Product list to details, greeting, contact card, colour picker returning a result, counter editor handling a null result.
- **Task 4: Named route arguments** (`task4_screen.dart`)
  - ScreenArguments class, number and its square, user profile, onGenerateRoute with type check, rating result from a named route.
- **Task 5: Transition animations** (`task5_screen.dart`)
  - Fade, slide from the right, slide from the bottom, scale with fade, reusable FadeRoute and a global page transitions theme.
- **Task 6: go_router** (`task6_screen.dart`)
  - go vs push, path parameters, extra object, named routes with errorBuilder, CustomTransitionPage with a reusable buildPage helper.

## Running the Project

From the `Tutorials/Lab_4` directory (Lab 4) or the `Tutorials/lab5_nav` directory (Lab 5):

```bash
flutter run
```
