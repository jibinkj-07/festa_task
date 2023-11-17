# Festa Task App

Welcome to Festa Task App project repository. This project is designed to fetch users data
from [https://randomuser.me/api/] 
and showing it into app

## Features

- **Authentication** : User can authenticate with their email and password
- **User Info**  : A list of 50 users data will list in home screen after successful authentication

## Getting Started

### Prerequisites

Before begin make sure you have the following installed:

- Flutter 3.-.- (Above 3)

### Installation

1. Clone the repository

   ```
   git clone https://github.com/jibinkj-07/festa_task.git
   cd festa_task 
   ```

### Code Structure

This project is following clean architecture with provider as state management.

- lib/core : Contains core functionalities for whole project includes custom styles, constant
  values, common widgets ,etc
- lib/features : Contains all modules for this project
    - /features/common : Module for placing commonly using data.
    - /features/auth : Module for authentication section like login.
    - /features/home : Module for fetching user data and showing

### Development Guidelines

- Follow clean architecture with SOLID principle.
- Use meaningful names for variables, functions and classes.
- Don\'t change core functionalities may lead to project break
- Utilize git with clear commit message

### Version History and Releases

- Android : 1.0.0+1 (18/11/23) - Initial launch