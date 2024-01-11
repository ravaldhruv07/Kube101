# Can you figure out the issues? 

## Scenario:
**You work at a fintech startup as a junior software developer. You've been tasked with a critical challenge!**

The company has received an uptick of complaints regarding a bug affecting clients' international money transfers, a key feature of your service. Fortunately, thanks to your hard work and expertise, you've found the root cause of the issue and applied the necessary fixes to the `intl-money-transfer-app` repository and are ready to roll out these changes.

However, as you initiate the deployment process, you run into an unexpected problem. The application pods just won't come up! 

_Can you apply your strong problem-solving skills and kubernetes knowhow to ensure that the critical fix that you've worked so hard for can go live?_


## Setup:

1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
2. Click on "Add a new instance".
3. Run this command to auto setup the quiz:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) &&  bash -x <( curl -L https://raw.githubusercontent.com/{tbd}/quizHost/main/quiz1.sh) && alias k=kubectl
  ```
4. There's a quiz1.yml file on your terminal. You can view its contents with ``` cat quiz1.yml ```
5. You can run the command ```k apply -f quiz1.yml ``` to attempt scheduling your pod/application.
6. Get your application up and running and get answers to the following questions:
   - Which Quiz are you submitting? **(Answer: Quiz1)**
   - Describe what was wrong with the deployment? What commands did you run to debug?
   - Why did the yaml spin up 2 pods instead of 1?
   - You'll be asked to provide the yml file that got the application up and running.


## When you're ready. Submit your answers here:
https://s.surveyplanet.com/57yl7v7x

