## Setup Instructions

### Step 1: Launching the dev container

The dev container creates a developer environment that automatically includes the necessary software and dependencies to run the Node server.

It also includes some nicities - A nice theme, a standardized formatting policy (so all developers will have code formatted the same way, preventing most formatting issues), and some other odds-and-ends (colorized brackets FTW!).

There is some 1-time setup, but afterwards you can skip straight to Step 5.

1. Install Docker [(link)](https://docs.docker.com/get-docker/)

   - You may need to enable virtualization on Windows. [Click this link for instructions](https://docs.docker.com/desktop/windows/troubleshoot/#virtualization) if you receive this error.
   - Additionally, for Windows users, if you haven't already installed WSL 2, you'll need to run this command in a Powershell window:

     `wsl --install -d Ubuntu`

     More on WSL [here](https://docs.microsoft.com/en-us/windows/wsl/install)

2. Open project in VS Code
3. Install extensions.

   - **Docker** by Microsoft
   - **Remote** - Containers by Microsoft

4. Control/Cmd+Shift+P (Command Pallete) -> Reload Window
5. Click bottom left -> Open in Container

### Step 2: Running the node application

1. Run commands _(Note: Make sure you are in the root directory!)_:

   1. `docker build -t node-dev-container .`
   2. `docker run -it --rm -p 4000:3000 node-dev-container`
   3. `npm run start` (once in container)

2. Test that the server and port forwarding are working by navigating to `http://localhost:4000`. You should see `"success": true`

3. To kill the container, open a new terminal and run the command `docker container list`. Take note of the container ID for "node-dev-container" and then run `docker kill <container id>`

### Troubleshooting

1. Issue: Receiving "Permission Denied" when running Docker commands inside the dev container.

   Solution: Rebuild container from command pallette (Control/Command+Shift+P)

2. "Hardware assisted virtualization and data execution protection must be enabled in the BIOS".

   Solution: Follow instructions in [this link](https://docs.docker.com/desktop/windows/troubleshoot/#virtualization) to allow virtualization
