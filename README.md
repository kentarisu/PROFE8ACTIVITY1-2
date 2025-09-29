# Edit Frame Studios - Flutter Video Editing Services App

A professional Flutter application for a video editing services business. The app showcases the company's portfolio, services offered, and allows potential clients to explore the business while demonstrating core Flutter concepts and best practices.

## 📱 App Overview

Edit Frame Studios is a business app for a video editing services company. Clients can browse the service portfolio, view completed projects, and learn about the company's offerings. The app features a clean two-tab navigation system with widget demos and a portfolio showcase using custom staggered grid layout.

---

## 📋 Tasks Completion Checklist

### ✅ Task 1: Project Organization
- **Status**: Complete
- Professional folder structure with models, views, widgets, and services
- Clean separation of concerns

### ✅ Task 2: StatelessWidget
- **Status**: Complete
- `HelloStateless` - Simple welcome screen demo
- Located in `lib/views/hello_stateless.dart`

### ✅ Task 3: StatefulWidget
- **Status**: Complete
- `HelloStateful` - Interactive studio statistics with counters
- State management for project and client tracking
- Located in `lib/views/hello_stateful.dart`

### ✅ Task 4: Custom Reusable Widget
- **Status**: Complete
- `CustomButton` widget used in **3 different screens**:
  1. HomeScreen - StatelessWidget and StatefulWidget demo buttons
  2. ServicesScreen - Platform Demo button
  3. HelloStateful - Add Project, Add Client, Reset buttons
- Located in `lib/widgets/custom_button.dart`

### ✅ Task 5: Material Design and Cupertino Widgets
- **Status**: Complete
- `PlatformDemoScreen` implements both design systems side-by-side
- Comparisons include: Buttons, Switches, Sliders, Dialogs, Pickers
- Located in `lib/views/platform_demo_screen.dart`

### ✅ Task 6: Navigation Implementation
- **Status**: Complete
- **BottomNavigationBar** with two main tabs:
  - Home tab - Widget demos
  - Services tab - Portfolio with staggered grid
- Named routes for demo screens

### ✅ Task 7: Widget Tree Diagram
- **Status**: Complete
- See detailed widget tree below

### ✅ Task 8: Refactoring
- **Status**: Complete
- Extracted `CustomButton` as reusable component
- Separated `ServicePortfolioGrid` with `PortfolioTile` children
- Modular screen components

### ✅ Task 9: Third-Party Package (Custom Implementation)
- **Status**: Complete
- Custom staggered grid implementation (alternative to flutter_staggered_grid_view)
- `ServicePortfolioGrid` with intelligent height-balancing algorithm
- Located in `lib/widgets/service_portfolio_grid.dart`

### ✅ Task 10: Documentation
- **Status**: Complete
- This README file

---

## 🌲 Widget Tree Diagram (Task 7)

### Main Application Hierarchy

```
VideoEditProApp (StatelessWidget)
│
└── MaterialApp
    │
    └── MainNavigationScreen (StatefulWidget)
        │
        ├── State: _selectedIndex (0 or 1)
        │
        └── Scaffold
            │
            ├── body: _pages[_selectedIndex]
            │   │
            │   ├── [0] HomeScreen (StatelessWidget)
            │   │
            │   └── [1] ServicesScreen (StatelessWidget)
            │
            └── bottomNavigationBar: BottomNavigationBar
                │
                ├── Tab 0: Home (Icons.home)
                │
                └── Tab 1: Services (Icons.video_library)
```

### HomeScreen Widget Tree

```
HomeScreen (StatelessWidget)
│
└── Scaffold
    │
    ├── AppBar
    │   └── title: Text("VideoEdit Pro")
    │
    └── body: SingleChildScrollView
        │
        └── Center
            │
            └── Padding
                │
                └── Column
                    │
                    ├── SizedBox(height: 20)
                    │
                    ├── Icon(Icons.video_camera_back, size: 80)
                    │
                    ├── Text("Welcome to VideoEdit Pro", fontSize: 22)
                    │
                    ├── Text("Professional video editing...", fontSize: 14)
                    │
                    ├── CustomButton ← REUSABLE WIDGET (Task 4)
                    │   ├── text: "StatelessWidget Demo"
                    │   ├── icon: Icons.widgets
                    │   ├── color: Colors.blue
                    │   └── onPressed: Navigate to /hello-stateless
                    │
                    └── CustomButton ← REUSABLE WIDGET (Task 4)
                        ├── text: "StatefulWidget Demo"
                        ├── icon: Icons.analytics
                        ├── color: Colors.green
                        └── onPressed: Navigate to /hello-stateful
```

### ServicesScreen Widget Tree

```
ServicesScreen (StatelessWidget)
│
└── Scaffold
    │
    ├── AppBar
    │   └── title: Text("Our Services")
    │
    └── body: SingleChildScrollView
        │
        └── Column
            │
            ├── Padding
            │   └── Column
            │       ├── Icon(Icons.video_library, size: 60)
            │       ├── Text("Video Editing Portfolio", fontSize: 24)
            │       ├── Text("Our featured projects...", fontSize: 16)
            │       └── CustomButton ← REUSABLE WIDGET (Task 4)
            │           ├── text: "Platform Demo"
            │           ├── icon: Icons.phone_android
            │           ├── color: Colors.orange
            │           └── onPressed: Navigate to /platform-demo
            │
            └── ServicePortfolioGrid ← CUSTOM STAGGERED GRID (Task 9)
                │
                └── CustomStaggeredGrid
                    │
                    └── SingleChildScrollView
                        │
                        └── Column
                            │
                            └── _buildRows() - Intelligent distribution
                                │
                                └── Row (left + right columns)
                                    │
                                    ├── Column (left)
                                    │   └── StaggeredGridItem(s)
                                    │       └── PortfolioTile(s)
                                    │
                                    └── Column (right)
                                        └── StaggeredGridItem(s)
                                            └── PortfolioTile(s)
```

### HelloStateful Widget Tree (StatefulWidget Demo)

```
HelloStateful (StatefulWidget)
│
├── State: _HelloStatefulState
│   ├── _projectsCompleted: int = 0
│   ├── _clientsServed: int = 0
│   ├── _addProject() → setState()
│   ├── _addClient() → setState()
│   └── _resetCounters() → setState()
│
└── Scaffold
    │
    ├── AppBar
    │   └── title: Text("StatefulWidget Demo")
    │
    └── body: Container (with gradient)
        │
        └── Center
            │
            └── Padding
                │
                └── Column
                    │
                    ├── Icon(Icons.analytics, size: 60)
                    │
                    ├── Text("Video Editing Studio Stats", fontSize: 24)
                    │
                    ├── _buildStatCard("Projects Completed", _projectsCompleted)
                    │   └── Card
                    │       └── Row
                    │           ├── Icon(trending_up/flat)
                    │           └── Column
                    │               ├── Text(title)
                    │               └── Text(count)
                    │
                    ├── _buildStatCard("Clients Served", _clientsServed)
                    │
                    ├── Row
                    │   ├── CustomButton ← REUSABLE WIDGET (Task 4)
                    │   │   ├── text: "Add Project"
                    │   │   ├── icon: Icons.add_circle
                    │   │   ├── color: Colors.green
                    │   │   └── onPressed: _addProject
                    │   │
                    │   └── CustomButton ← REUSABLE WIDGET (Task 4)
                    │       ├── text: "Add Client"
                    │       ├── icon: Icons.person_add
                    │       ├── color: Colors.orange
                    │       └── onPressed: _addClient
                    │
                    └── CustomButton ← REUSABLE WIDGET (Task 4)
                        ├── text: "Reset All"
                        ├── icon: Icons.refresh
                        ├── color: Colors.red
                        └── onPressed: _resetCounters
```

### PlatformDemoScreen Widget Tree (Material vs Cupertino)

```
PlatformDemoScreen (StatefulWidget)
│
├── State: _PlatformDemoScreenState
│   ├── _materialSwitchValue: bool
│   ├── _cupertinoSwitchValue: bool
│   ├── _materialSliderValue: double
│   ├── _cupertinoSliderValue: double
│   └── _selectedVideoQuality: String
│
└── Scaffold
    │
    ├── AppBar
    │   ├── leading: IconButton(back arrow)
    │   └── title: Text("Platform Demo")
    │
    └── body: SingleChildScrollView
        │
        └── Column
            │
            ├── _buildPlatformHeader()
            │   └── Card with platform info
            │
            ├── _buildButtonComparison()
            │   └── Card
            │       └── Row
            │           ├── Material: ElevatedButton ← Material Design (Task 5)
            │           └── Cupertino: CupertinoButton.filled ← Cupertino (Task 5)
            │
            ├── _buildSwitchComparison()
            │   └── Card
            │       └── Row
            │           ├── Material: Switch ← Material Design (Task 5)
            │           └── Cupertino: CupertinoSwitch ← Cupertino (Task 5)
            │
            ├── _buildSliderComparison()
            │   └── Card
            │       └── Row
            │           ├── Material: Slider ← Material Design (Task 5)
            │           └── Cupertino: CupertinoSlider ← Cupertino (Task 5)
            │
            ├── _buildDialogComparison()
            │   └── Card
            │       └── Row
            │           ├── Material: AlertDialog ← Material Design (Task 5)
            │           └── Cupertino: CupertinoActionSheet ← Cupertino (Task 5)
            │
            └── _buildPickerComparison()
                └── Card
                    └── Row
                        ├── Material: DropdownButton ← Material Design (Task 5)
                        └── Cupertino: CupertinoPicker ← Cupertino (Task 5)
```

### CustomButton Widget Structure (Reusable Component)

```
CustomButton (StatelessWidget) ← USED IN 3 SCREENS (Task 4)
│
├── Props:
│   ├── text: String (required)
│   ├── icon: IconData? (optional)
│   ├── onPressed: VoidCallback (required)
│   ├── color: Color? (optional, default: deepPurple)
│   ├── width: double? (optional, default: 140)
│   ├── height: double? (optional, default: 45)
│   └── isLoading: bool (optional, default: false)
│
└── Build:
    └── SizedBox(width × height)
        │
        └── ElevatedButton
            ├── style: backgroundColor, shape, elevation
            │
            └── child: LayoutBuilder
                │
                └── Row
                    ├── if (icon != null): Icon(icon, size: 18)
                    ├── SizedBox(width: 8)
                    └── Expanded
                        └── Text(text, fontSize: 14)
```

### ServicePortfolioGrid (Custom Staggered Grid Implementation)

```
ServicePortfolioGrid (StatelessWidget) ← TASK 9
│
├── portfolioItems: List<PortfolioItem> (8 items)
│   ├── Wedding Video, Corporate, Music Video
│   ├── Social Media, Commercial, Documentary
│   └── Brand Story, Event Highlight
│
└── Build:
    └── SizedBox(height: 600)
        │
        └── Padding(all: 16)
            │
            └── CustomStaggeredGrid
                │
                ├── Algorithm: Intelligent height balancing
                │   ├── Tracks cumulative height of left/right columns
                │   ├── Places item in shorter column
                │   └── Supports full-width items (span both columns)
                │
                └── Build:
                    └── SingleChildScrollView
                        │
                        └── Column
                            │
                            └── _buildRows()
                                │
                                └── Multiple Row widgets
                                    │
                                    ├── Expanded (left column)
                                    │   └── Column
                                    │       └── StaggeredGridItem(s)
                                    │           ├── height: 140px, 160px, or 200px
                                    │           └── child: PortfolioTile
                                    │
                                    └── Expanded (right column)
                                        └── Column
                                            └── StaggeredGridItem(s)
                                                └── child: PortfolioTile
```

### PortfolioTile Widget

```
PortfolioTile (StatelessWidget)
│
├── Props:
│   └── item: PortfolioItem
│       ├── title: String
│       ├── type: String
│       ├── duration: String
│       ├── color: Color
│       └── icon: IconData
│
└── Build:
    └── GestureDetector
        ├── onTap: _showPortfolioDialog
        │
        └── Container (gradient background)
            │
            └── Padding(all: 12)
                │
                └── Column
                    │
                    ├── Row
                    │   ├── Icon(item.icon, size: 20)
                    │   └── Container (duration badge)
                    │       └── Text(item.duration)
                    │
                    ├── Flexible
                    │   └── Text(item.title, fontSize: 14, maxLines: 2)
                    │
                    ├── Text(item.type, fontSize: 10)
                    │
                    └── Row
                        ├── Icon(Icons.play_circle_outline, size: 14)
                        └── Text("Preview", fontSize: 10)
```

---

## 📁 Project Structure (Task 10)

### Folder Organization

```
edit_frame_studios/
├── lib/
│   ├── main.dart                    # App entry point with BottomNavigationBar
│   ├── models/                      # Data models and constants
│   │   └── app_data.dart           # Service info and contact details
│   ├── views/                       # Screen/page widgets
│   │   ├── home_screen.dart        # Home tab with demo buttons
│   │   ├── services_screen.dart    # Services tab with portfolio grid
│   │   ├── hello_stateless.dart    # StatelessWidget demo (Task 2)
│   │   ├── hello_stateful.dart     # StatefulWidget demo (Task 3)
│   │   └── platform_demo_screen.dart # Material vs Cupertino (Task 5)
│   ├── widgets/                     # Reusable UI components
│   │   ├── custom_button.dart      # Reusable button (Task 4)
│   │   ├── app_drawer.dart         # Navigation drawer (unused)
│   │   └── service_portfolio_grid.dart # Staggered grid (Task 9)
│   └── services/                    # Business logic
│       └── navigation_service.dart  # Navigation helpers (unused)
├── pubspec.yaml                     # Dependencies
└── README.md                        # This file
```

### Architecture Reasoning

#### **Models Folder**
- **Purpose**: Centralized data storage for app constants
- **Why**: Keeps service information, pricing, and contact details in one place
- **Benefits**: Easy to update, type-safe data access
- **Contents**: `app_data.dart` with static service data

#### **Views Folder**
- **Purpose**: Complete screen widgets (full pages)
- **Why**: Separates main navigable screens from reusable components
- **Responsibility**: Each view manages screen-specific layout and logic
- **Examples**: HomeScreen, ServicesScreen, demo screens

#### **Widgets Folder**
- **Purpose**: Reusable UI components used across multiple screens
- **Why**: Promotes code reuse, consistency, and easier maintenance
- **Principle**: Each widget should be self-contained and reusable
- **Examples**: CustomButton (used in 3 screens), ServicePortfolioGrid

#### **Services Folder**
- **Purpose**: Business logic and utility functions
- **Why**: Separates logic from UI for better testing and organization
- **Benefits**: Easier unit testing, cleaner component code
- **Note**: Currently minimal usage in this demo app

---

## 🎯 Key Features Implementation

### Navigation (Task 6)
- **BottomNavigationBar** with 2 tabs: Home and Services
- **State management** with `_selectedIndex` in `MainNavigationScreen`
- **Named routes** for demo screens: `/hello-stateless`, `/hello-stateful`, `/platform-demo`

### Reusable Components (Task 4 & 8)
- **CustomButton**: Used in HomeScreen, ServicesScreen, and HelloStateful
- **Props**: text, icon, onPressed, color, width, height, isLoading
- **Features**: Loading state, icon support, customizable styling

### State Management (Task 3)
- **HelloStateful**: Demonstrates StatefulWidget with interactive counters
- **State variables**: `_projectsCompleted`, `_clientsServed`
- **State methods**: `_addProject()`, `_addClient()`, `_resetCounters()`
- **UI updates**: `setState()` triggers rebuilds on counter changes

### Platform Widgets (Task 5)
- **PlatformDemoScreen**: Side-by-side comparison of design systems
- **Material widgets**: ElevatedButton, Switch, Slider, AlertDialog, DropdownButton
- **Cupertino widgets**: CupertinoButton, CupertinoSwitch, CupertinoSlider, CupertinoActionSheet, CupertinoPicker
- **Interactive demos**: All widgets are functional with state management

### Custom Staggered Grid (Task 9)
- **Algorithm**: Intelligent height-balancing between left/right columns
- **Heights**: Full-width (140px), Taller (200px), Normal (160px)
- **Distribution**: Places items in shorter column for balanced appearance
- **Implementation**: Pure Flutter with no external dependencies
- **Items**: 8 portfolio tiles with video project information

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio/VS Code with Flutter extensions

### Installation
```bash
# Clone or download the project
cd video_editing_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

---

## 🔍 Widget Tree Explanation (Task 7)

### Parent-Child Relationships

1. **Root Level**: 
   - `VideoEditProApp` (StatelessWidget) is the root
   - Contains `MaterialApp` which handles theming and routing

2. **Navigation Level**:
   - `MainNavigationScreen` (StatefulWidget) manages tab state
   - Contains `Scaffold` with `BottomNavigationBar`
   - `_selectedIndex` determines which page to show

3. **Screen Level**:
   - `HomeScreen` and `ServicesScreen` are the two main pages
   - Each has its own `Scaffold` with `AppBar` and scrollable body

4. **Component Level**:
   - `CustomButton` is reused across multiple screens
   - `ServicePortfolioGrid` contains the staggered grid implementation
   - `PortfolioTile` represents individual portfolio items

5. **Layout Level**:
   - Standard Flutter layout widgets: `Column`, `Row`, `Padding`, `Center`
   - Scrollable containers: `SingleChildScrollView`
   - Sizing: `SizedBox`, `Expanded`, `Flexible`

### Widget Hierarchy Depth

**Deepest path**: 
`VideoEditProApp` → `MaterialApp` → `MainNavigationScreen` → `Scaffold` → `body` → `ServicesScreen` → `Scaffold` → `SingleChildScrollView` → `Column` → `ServicePortfolioGrid` → `CustomStaggeredGrid` → `SingleChildScrollView` → `Column` → `Row` → `Column` → `StaggeredGridItem` → `PortfolioTile` → `GestureDetector` → `Container` → `Padding` → `Column` → `Flexible` → `Text`

**Total depth**: ~20 levels in the deepest part of the tree

---

## 🧪 Refactoring Examples (Task 8)

### Before Refactoring (Problematic)
```dart
// HomeScreen with inline button implementation
ElevatedButton(
  onPressed: () => Navigator.pushNamed(context, '/hello-stateless'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: const Text('StatelessWidget Demo'),
)
```

### After Refactoring (Clean)
```dart
// HomeScreen using CustomButton
CustomButton(
  text: 'StatelessWidget Demo',
  icon: Icons.widgets,
  onPressed: () => Navigator.pushNamed(context, '/hello-stateless'),
  color: Colors.blue,
  width: 250,
  height: 55,
)
```

### Benefits of Refactoring
- **Code reuse**: CustomButton used in 3 different screens
- **Consistency**: All buttons have same styling and behavior
- **Maintainability**: Change button style in one place
- **Readability**: Cleaner, more declarative code

---

## 📊 Staggered Grid Algorithm (Task 9)

### How It Works

The custom staggered grid implementation uses an intelligent balancing algorithm:

1. **Track column heights**: Maintains cumulative height for left and right columns
2. **Smart placement**: Places each item in the shorter column
3. **Full-width support**: Some items span both columns (every 3rd item)
4. **Varying heights**: Items have different heights (140px, 160px, 200px)
5. **Visual balance**: Results in a Pinterest-style staggered layout

### Algorithm Pseudocode
```
for each item in portfolioItems:
  if item.isFullWidth:
    add item spanning both columns
  else:
    leftHeight = sum of all items in left column
    rightHeight = sum of all items in right column
    
    if leftHeight <= rightHeight:
      place item in left column
    else:
      place item in right column
```

### Why Custom Implementation?
- **No external dependencies**: Works in any Flutter environment
- **Full control**: Can customize algorithm for specific needs
- **Learning opportunity**: Demonstrates layout principles
- **Performance**: Efficient with Column/Row widgets

---

## 🎨 Design Patterns Used

### 1. **Separation of Concerns**
- Views handle screen layout
- Widgets handle reusable components
- Models handle data
- Services handle business logic

### 2. **Component Composition**
- Small, focused widgets
- Composed into larger screens
- Reusable across app

### 3. **State Management**
- StatefulWidget for interactive components
- setState() for local state updates
- Props passed down the tree

### 4. **Navigation Pattern**
- BottomNavigationBar for main tabs
- Named routes for secondary screens
- Navigator.pushNamed() for navigation

---

## 📝 Conclusions

This project successfully demonstrates all 10 Flutter hands-on tasks:

1. ✅ **Organized project structure** with clear folder hierarchy
2. ✅ **StatelessWidget** implementation (HelloStateless)
3. ✅ **StatefulWidget** with state management (HelloStateful)
4. ✅ **Reusable CustomButton** used in 3 screens
5. ✅ **Material and Cupertino** widgets comparison
6. ✅ **BottomNavigationBar** for two-page navigation
7. ✅ **Widget tree diagram** with detailed explanations
8. ✅ **Refactored code** into modular components
9. ✅ **Custom staggered grid** implementation
10. ✅ **Complete documentation** in README

### Key Learning Outcomes
- Understanding Flutter widget hierarchy and composition
- State management with StatefulWidget for business data
- Creating reusable UI components for business apps
- Platform-specific UI implementations for cross-platform businesses
- Custom layout algorithms for portfolio presentation
- Clean code architecture for service-based applications

### Business Context
This app demonstrates how Flutter can be used to create professional business applications for service companies. The video editing services company can showcase their work, attract clients, and provide information about their offerings through a polished mobile application.

---

**Created for educational purposes demonstrating Flutter best practices in business app development**

*Last updated: September 2025*