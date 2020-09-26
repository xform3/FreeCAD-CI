// FreeCAD CI
//
//


pipeline {
  agent any

  stages {
    agent { dockerfile true }
    stage('Fetch sources') {
      steps {
        git branch: 'master',
            url: 'https://github.com/FreeCAD/FreeCAD'

        sh "ls -lat"
      }
    }

    stage('Build') {
      steps {
        sh 'mkdir build; cd build'
        sh 'cmake ../freecad-source -DBUILD_QT5=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 -DUSE_PYBIND11=ON'
        sh 'make -j4'
      }
    }

    stage('Create App Image') {
      steps {
        echo 'Skipping creating images'
      }
    }

    stage('Upload App Image') {
      steps {
        echo 'Skipping uploading app images'
      }
    }
  }

}
