# # assume we have a working conda available
conda create \
    -p APP/FreeCAD.app/Contents/Resources \
    freecad=0.18 calculix blas=*=openblas gitpython \
    numpy matplotlib scipy sympy pandas six pyyaml jinja2 \
    --copy \
    --no-default-packages \
    -c freecad/label/dev_cf201901 \
    -c conda-forge/label/cf201901 \
    -y


# installing some additional libraries with pip
version_name=$(conda run -p APP/FreeCAD.app/Contents/Resources python get_freecad_version.py)


conda list -p APP/FreeCAD.app/Contents/Resources

# # delete unnecessary stuff
rm -rf APP/FreeCAD.app/Contents/Resources/include
find APP/FreeCAD.app/Contents/Resources -name \*.a -delete
mv APP/FreeCAD.app/Contents/Resources/bin APP/FreeCAD.app/Contents/Resources/bin_tmp
mkdir APP/FreeCAD.app/Contents/Resources/bin
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/FreeCAD APP/FreeCAD.app/Contents/Resources/bin/
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/FreeCADCmd APP/FreeCAD.app/Contents/Resources/bin
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/ccx APP/FreeCAD.app/Contents/Resources/bin/
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/python APP/FreeCAD.app/Contents/Resources/bin/
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/pip APP/FreeCAD.app/Contents/Resources/bin/
cp APP/FreeCAD.app/Contents/Resources/bin_tmp/pyside2-rcc APP/FreeCAD.app/Contents/Resources/bin/
cp PP/FreeCAD.app/Contents/Resources/bin_tmp/assistant PP/FreeCAD.app/Contents/Resources/bin/
sed -i "" '1s|.*|#!/usr/bin/env python|' APP/FreeCAD.app/Contents/Resources/bin/pip
rm -rf APP/FreeCAD.app/Contents/Resources/bin_tmp

# add documentation
cp ../../doc/* APP/FreeCAD.app/Contents/Resources/doc

# Remove __pycache__ folders and .pyc files
conda deactivate
find . -path "*/__pycache__/*" -delete
find . -name "*.pyc" -type f -delete

# create the dmg
hdiutil create -volname "${version_name}" -srcfolder ./APP -ov -format UDZO "${version_name}.dmg"

# create hash
shasum -a 256 ${version_name}.dmg > ${version_name}.dmg-SHA256.txt
