# ai-devops-pipeline1

This is a simple DevOps CI/CD pipeline project using **Jenkins**, **Docker**, and **GitHub**. The pipeline builds a Docker image and pushes it to Docker Hub using Jenkins stages.

---

## 🚀 Pipeline Stages

### 1. Build Docker Image
Builds the Docker image from the `Dockerfile`.

### 2. Push Docker Image
Pushes the Docker image to your Docker Hub account.

---

## 📁 Project Structure

\`\`\`
.
├── Jenkinsfile
├── Dockerfile
├── app/ (your application code)
└── README.md
\`\`\`

---

## ⚙️ Commands Used in the Terminal (Copy/Paste)

### ✅ 1. Initialize Git Repository

\`\`\`bash
git init
\`\`\`

### ✅ 2. Add Files

\`\`\`bash
git add .
\`\`\`

### ✅ 3. Commit Changes

\`\`\`bash
git commit -m "Initial commit: add Dockerfile and Jenkinsfile"
\`\`\`

### ✅ 4. Connect to GitHub

\`\`\`bash
git remote add origin https://github.com/YOUR_USERNAME/ai-devops-pipeline1.git
\`\`\`

### ✅ 5. Push to GitHub

\`\`\`bash
git branch -M main
git push -u origin main
\`\`\`

---

## 🐳 Docker Commands Used

### ✅ Build Docker Image

\`\`\`bash
docker build -t your-dockerhub-username/your-image-name .
\`\`\`

### ✅ Login to Docker

\`\`\`bash
docker login
\`\`\`

### ✅ Push Docker Image

\`\`\`bash
docker push your-dockerhub-username/your-image-name
\`\`\`

---

## 🔧 Jenkins Configuration

1. Create a **Pipeline** in Jenkins named \`ai-devops-pipeline1\`.
2. Use \`Pipeline script from SCM\`.
3. Connect your GitHub repo.
4. Jenkinsfile content:

\`\`\`groovy
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t your-dockerhub-username/your-image-name .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin'
                    sh 'docker push your-dockerhub-username/your-image-name'
                }
            }
        }
    }
}
\`\`\`

---

## 📌 Notes

- Replace \`your-dockerhub-username/your-image-name\` with your actual Docker Hub repo.
- Replace \`docker-hub-credentials\` with the correct Jenkins credential ID.

---

## ✅ Result

Once pushed, Jenkins will automatically:
1. Clone the repo.
2. Build the Docker image.
3. Push it to Docker Hub.

---
