node {
	def registry = "arjunvyadav/myapp"
	def registryCredential = "dockerhub"

        stage('Checkout') {
            git url: 'https://github.com/arjun-venkatesh1/registration-login-java-xml-maven-jsp-mysql.git', branch: 'master'
        }
        def app
        stage('Image') {
                app = docker.build("${registry}:${env.BUILD_NUMBER}")
       }
       stage('Docker push')
        {
            docker.withRegistry('https://registry.hub.docker.com', "${registryCredential}") {
		app.push()
                app.push('latest')
              }
       }
	   stage('Deployment to Kubernetes cluster') {
			kubernetesDeploy(
				credentialsType: 'KubeConfig',
				kubeConfig: [path: '/root/.jenkins/workspace/.kube/config'],
				configs: '/home/arjunsin143as/k8s/application-deployment.yml',
			)
	   }
}
pipeline {
   
    agent any
    stages {
        stage('test'){
            steps {
                echo 'Cleaning Work Space'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
