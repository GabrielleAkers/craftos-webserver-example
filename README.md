# craftos-webserver-example

An example webserver I wrote for a [question on reddit](https://www.reddit.com/r/ComputerCraft/comments/1l8nxvj/computercraft_remote_access/) on how to send data from a minecraft server running cc:Tweaked to a webpage.

I included a Dockerfile and two deploy scripts you can use to run it if you don't want to install a bunch of dependencies (besides Docker).

## Running the webserver
Install node v24 then
```
cd webserver
npm install
npm start
```
The default port is 8081
The server will be accessible at `http://localhost:8081`

### Running in Docker locally
Install docker then just do
```
sudo ./deploy_local.sh
```

### Running in Docker on a remote machine
Assuming you have a remote server with ssh access set up and Docker installed on it:
```
EXAMPLESERVER_KEY=/path/to/your/ssh/key EXAMPLESERVER_HOST=<your-remote-ip> ./deploy_remote.sh
```
This creates a new docker context using ssh that builds and runs the container on your remote machine.
The server will be accessible at `http://<your-remote-ip>:8081`

## Sending data from computercraft
Put the file [datasender.lua](/datasender.lua) on your computercraft computer and then do
```
datasender http://<your-ip>:8081
```
This will send some fake data every 5 seconds to the web server which will populate in a list on the webpage.

![the webpage](/images/example_webpage.png "Here's what it looks like")

