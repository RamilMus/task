
1) Write an app using Flask

1.1) command to install Flask
```
python3 -m venv venv
. venv/bin/activate
pip install Flask
pip3 install pytz
```
1.2) Test app localy
During writing the app could not make the clock count down when refreshed, had to change to time_feed.

2) Create Docker container with app inside
Docker container has been built and it runs. I had to add host=0.0.0.0 to be able to see it in localhost, [read](https://hub.docker.com/r/tiangolo/uwsgi-nginx-flask/)

2.1) Create big Docker image and test it
Big image size 292 mb. I wrote small bash script to run and test container every time.

2.2) Try to use multisaged Docker and test the app
Size of image 14.1 mb now and app is running localy on http://127.0.0.1:5000/ or my ip http://192.168.0.38:5000/

3) Write Iac using terraform to set up EC2 as a webserver

3.1) Write terraform to create EC2

```
terraform init
terraform plan
terraform apply
terraform destroy
```

3.2) Try to push and run on crated EC2
newec.tf file contain terraform code to launch ec2 and security group

3.3) Try to push and run Docker container on Ec2 manually
how to install docker on debian
https://phoenixnap.com/kb/how-to-install-docker-on-debian-10 
sudo chmod 666 /var/run/docker.sock

4) Write Ansible playbook to push Docker and run the app from EC2

5) ssl managment and domain
domain may be set up in 53 route

# Test for DevOps

The Scenario
We have several developers teams where each member has a different OS, compiler/interpreter version, dependencies installed on the local computer. To uniform all this we use Docker containers.
Your job is to automate the provisioning of instances with the application. 
Task
Write an application.
Use whatever programing language you’re familiar with.  Write a simple web server with REST interface which returns "Hello world! Time is: TIME_IN_MOSCOW"
Build Docker image for your application (create Dockerfile, use best practices).
Write IaC to provision a VM with your preferred cloud vendor of choice.
Use whatever OS/image you’re familiar with - Debian or Redhat derivative is probably the safest option. 
Use terraform - infrastructure-as-code tool.
Warning - We’re expecting you to test using your own account you have with a preferred cloud vendor, this will incur a small charge in the order of cents/pennies for the duration of the test- don’t forget to deprovision these services after you’ve completed the challenge!
Automate the bootstrapping of the application you wrote, on this VM.
Use ansible to accomplish this task (use best practices).
Usage of a self-signed certificate is fine
If you don’t have a domain you can add records to /etc/hosts for testing
After you finish bootstrapping, you should be able to open https://app.yourdomain.com in your browser and see the message  "Hello world! Time is: TIME_IN_MOSCOW"

