# Are you up for a challenge? 



## Setup:

1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
2. Click on "Add a new instance".
3. Run this command to auto setup the quiz:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) &&  bash -x <( curl -L https://raw.githubusercontent.com/{tbd}/quizHost/main/quiz2.sh) && alias k=kubectl
  ```
4. There's a quiz1.yml file on your terminal. You can view its contents with ``` cat quiz2.yml ```
5. You can run the command ```k apply -f quiz2.yml ``` to attempt scheduling your pod/application.
6. Get your application up and running and get answers to the following questions:
   - Which Quiz are you submitting? **(Answer: Quiz2)**
   - Describe what was wrong with the deployment? What commands did you run to debug?
   - Why did the yaml spin up 2 pods instead of 1?
   - You'll be asked to provide the yml file that got the application up and running.


## When you're ready. Submit your answers here:
https://s.surveyplanet.com/57yl7v7x
