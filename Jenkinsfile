pipeline {
    agent none

    stages {
        stage('Terraform Init') {
            agent { label 'terraform-agent' }
            steps {
                script {
                    // Checkout the code from the GitHub repository
                    git 'https://github.com/Black-5-Knight/ci-cd-nexus-ansible-deployment.git'
                }
                sh 'cd terraform && terraform init'
            }
        }

        stage('Terraform Plan') {
            agent { label 'terraform-agent' }
            steps {
                sh 'cd terraform && terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            agent { label 'terraform-agent' }
            steps {
                sh 'cd terraform && terraform apply -auto-approve tfplan'
            }
        }

        stage('Generate Ansible Inventory') {
            agent { label 'terraform-agent' }
            steps {
                script {
                    // Fetch the public IP from Terraform output
                    def publicIp = sh(script: 'cd terraform && terraform output -raw public_ip', returnStdout: true).trim()
                    writeFile file: 'ansible/inventory.ini', text: "[nexus]\n${publicIp}"
                }
            }
        }

        stage('Push Inventory to GitHub') {
            agent { label 'terraform-agent' }
            steps {
                script {
                    // Push inventory to GitHub
                    sh '''
                        cd ansible
                        git config --global user.email "you@example.com"
                        git config --global user.name "Your Name"
                        git add inventory.ini
                        git commit -m "Update Ansible inventory"
                        git push origin main
                    '''
                }
            }
        }

        stage('Ansible Playbook') {
            agent { label 'ansible-agent' }
            steps {
                script {
                    // Checkout the Ansible playbook from the same GitHub repository
                    git 'https://github.com/Black-5-Knight/ci-cd-nexus-ansible-deployment.git'
                }
                sh 'cd ansible && ansible-playbook -i inventory.ini install_nexus.yml'
            }
        }
    }
    
    post {
        always {
            // Clean up resources or notify
            echo 'Pipeline finished.'
        }
    }
}
