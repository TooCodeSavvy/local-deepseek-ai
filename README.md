Local DeepSeek AI
=================

This repository sets up a local instance of **DeepSeek AI** with **OpenWebUI**, running in **Docker**. It includes all the necessary scripts, Docker configurations, and instructions to get you up and running quickly.

Prerequisites
-------------

Before running the setup script, ensure your system meets the following requirements:

-   **Ubuntu** or **Debian-based** Linux distribution (but may work on other systems with some modifications).
-   At least **16 GB of RAM** (for larger models).
-   A **working internet connection** to pull Docker images and models.
-   **Docker** and **Docker Compose** (These will be installed if not already present).

Getting Started
---------------

### 1\. Clone the Repository

Start by cloning this repository to your local machine:
```
https://github.com/TooCodeSavvy/local-deepseek-ai.git
cd local-deepseek-ai
```
This will pull down all the necessary files, including the **`Dockerfile`**, **`docker-compose.yml`**, and **`setup.sh`** script.

### 2\. Make the Setup Script Executable

Change the permissions of the **`setup.sh`** script to make it executable:
```
chmod +x setup.sh
```
### 3\. Run the Setup Script

Now, run the **`setup.sh`** script. This script will install **Docker**, **Docker Compose**, and set up the environment for running the DeepSeek AI models with OpenWebUI.
```
./setup.sh
```
#### What the script does:

-   Installs **Docker** and **Docker Compose** if they are not already installed.
-   Creates a project directory for Docker containers and models.
-   Pulls the necessary containers using **Docker Compose**.
-   Starts the DeepSeek AI containers and the **OpenWebUI**.

### 4\. Access the OpenWebUI

Once the script has finished running successfully, you can access the **OpenWebUI** interface through your browser at:
```
http://<IP>:3000
```
Replace `<IP>` with the IP address of your server (or `localhost` if running locally).

### 5\. Using the Web UI

After accessing the **OpenWebUI**, you can:

-   Select the model to use (e.g., **DeepSeek-R1:1.5b**, **DeepSeek-R1:7b**, etc.).
-   Interact with the AI models through the browser interface.

### 6\. Stopping and Restarting the Containers

-   **To stop the containers**:
    ```
    docker-compose down
    ```
-   **To restart the containers**: 
    ```
    docker-compose up -d
    ```

If the containers are already running and you want to pull new updates, use `git pull` to update the repository.

### Supported Models

This setup currently includes several DeepSeek models that you can choose from in **OpenWebUI**:

-   **DeepSeek-R1:1.5b**
-   **DeepSeek-R1:7b**
-   **DeepSeek-R1:14b**
-   **DeepSeek-R1:32b**
-   **DeepSeek-R1:70b**

You can modify the configuration files to change the model you're using or specify custom configurations.

Troubleshooting
---------------

-   **Docker issues**: If Docker fails to start, ensure your system meets the minimum requirements for Docker. Also, check for conflicts with other services.
-   **Port conflicts**: If port 3000 is already in use, change the port number in the `docker-compose.yml` file.
-   **Permission errors**: If you encounter permission errors with Docker, try running the commands with `sudo`.

License
-------

This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgements
----------------

This project uses the following tools and technologies:

-   [Docker](https://www.docker.com/)
-   [Docker Compose](https://docs.docker.com/compose/)
-   [DeepSeek AI](https://www.deepseek.ai/)
-   [OpenWebUI](https://github.com/open-webui/open-webui)