// FreeCAD CI
//
//


pipeline {
  agent { 
    dockerfile {
      filename 'Dockerfile'
    }
  }

  stages {
    stage('Fetch sources') {
      steps {
        sh 'ls -lat'
      }
    }

    stage('Build') {
      steps {
        sh 'mkdir -p build; cd build; mkdir -p FreeCAD; cmake ../FreeCAD -DCMAKE_INSTALL_PREFIX=`pwd`/FreeCAD -DBUILD_QT5=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 -DUSE_PYBIND11=ON && make -j4 install'
      }
    }

    stage('Create App Image') {
      steps {
        echo 'Creating App Image'
        sh 'curl -LO https://raw.githubusercontent.com/AppImage/AppImages/master/pkg2appimage; \
            wget "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"; \
            chmod a+x appimagetool-x86_64.AppImage; \
            wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh; \
            bash miniconda.sh -b -p $HOME/miniconda; \
            . $HOME/miniconda/etc/profile.d/conda.sh; \
            '
        sh 'cp -r build/FreeCAD/* conda/linux_dev/AppDir; cd conda/linux_stable; bash ./linux_stable.sh; cd ../;'
      }
    }

    stage('Upload App Image') {
      steps {
        echo 'Skipping uploading app images'
      }
    }
  }

  post {
    success {
      archiveArtifacts artifacts: 'build/FreeCAD', fingerprint: true
    }
  }

}
