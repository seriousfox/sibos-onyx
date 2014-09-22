# Sibos Onyx

## Development setup
1. cd into directory
2. bundle install
3. foreman start
4. open 0.0.0.0:5000


## Demo setup
- Download the zip file and move it to your desktop and unzip it
- Open the terminal application which is located in the Utilities folder inside of Applications
- Copy the following line into terminal and press Enter (You will need to keep terminal open for the duration of the conference)
```
cd ~/Desktop/sibos-onyx && bundle install && rake assets:precompile && RACK_ENV=production bundle exec unicorn -p 5000 -c ./unicorn
```
- To access the website on your laptop you can go to ```http://0.0.0.0:5000```
- To access on another machine you will need to get the IP address of the computer, you can do this by click the apple icon > System Preferences > Network > Wi-Fi and copy the IP Address you see there. 
- Enter the number (it looks like xxx.xxx.x.xxx) plus :5000 e.g. ```http://192.168.1.120:5000``` 
- Type this address into the iPad to access the site **note: The iPad needs to be on the same network**