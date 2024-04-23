## Project Initialization Script

This script automates the process of creating and setting up a new project directory for a Node.js application based on Express.js and TypeScript.

### Usage

```
./init-project.sh <directory-keyword> <project-name>
```

- `<directory-keyword>`: A keyword representing the directory where the project will be created.
- `<project-name>`: The name of the project.

### Prerequisites

- Node.js and npm should be installed on your system.

### Instructions

1. **Configuration**:

   - Create the `config.sh` file to specify the directories where you want to create your projects.
   - You can create a directory on this way:

   ```
   declare -A directories
   directories["your keyword"]="your directory"
   ```

   - Also configurate you author name

   ```
   author='your author name'
   ```
   
   - You can configurate the path for your shell to execute the .sh everywhere

   ```
    export PATH="$PATH:"your .sh path"
   ```

2. **Run the Script**:

   - Execute the script `b-nodejs.sh` with the appropriate arguments.

3. **Project Initialization**:

   - The script creates a new directory based on the specified `<project-name>` within the directory corresponding to the `<directory-keyword>`.

4. **Dependency Installation**:

   - Initializes a new npm project and installs necessary dependencies such as Express.js, TypeScript, and related types.

5. **Configuration Files**:

   - Generates `package.json` and `tsconfig.json` files with predefined configurations.

6. **Source Code**:

   - Creates a `src` directory and generates `index.ts` and `app.ts` files with basic Express.js setup.

7. **Development Environment**:

   - Opens the project directory in Visual Studio Code for further development.

8. **Start the Project**:
   - Initiates the project in development mode using `ts-node-dev`.

### Notes

- Customize the configuration in `config.sh` according to your preferred directory structure.
- You can extend or modify this script to support additional project setups or configurations.
