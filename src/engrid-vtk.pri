!debian {
  !openfoam {
    INCLUDEPATH += $(VTKINCDIR)
    LIBS += -L$(VTKLIBDIR)
  }
  else {
    message("Configuring for OpenFOAM+paraview")

    # #######################
    #
    # some hacks to reuse the OpenFOAM paraview files
    #
    VTKDIR = $(ParaView_DIR)

    !win32 {
	LIBS += -L$(ParaView_DIR)/lib/paraview-3.5
	QMAKE_CXXFLAGS += -DVTK_EXCLUDE_STRSTREAM_HEADERS
    # reuse the OpenFOAM paraview files
    # should be easier when the PARAVIEW_INSTALL_DEVELOPMENT:BOOL=ON works better
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Common
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Filtering
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Graphics
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/GUISupport/Qt
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Hybrid
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/IO
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Rendering
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Utilities
	INCLUDEPATH += $(ParaView_INST_DIR)/VTK/Widgets
	INCLUDEPATH += $(ParaView_DIR)/VTK
	INCLUDEPATH += $(ParaView_DIR)/VTK/GUISupport/Qt
	INCLUDEPATH += $(ParaView_DIR)/VTK/Utilities
    }

    win32 {
	VTK_DIR = C:\VTK
	VTK_SRCDIR = C:\VTK\5.0.4
	LIBS += -L$$VTK_DIR\bin\release
	LIBS += -lvtkRendering
	LIBS += -lvtkFiltering
	LIBS += -lvtkIO
	LIBS += -lvtkfreetype
	LIBS += -lvtkftgl
	LIBS += -lvtkexpat
	LIBS += -lvtkzlib
	INCLUDEPATH += $$VTK_SRCDIR\COMMON
	INCLUDEPATH += $$VTK_SRCDIR\FILTER~1
	INCLUDEPATH += $$VTK_SRCDIR\GUISUP~1\QT
	INCLUDEPATH += $$VTK_SRCDIR\GENERI~1
	INCLUDEPATH += $$VTK_SRCDIR\GRAPHICS
	INCLUDEPATH += $$VTK_SRCDIR\HYBRID
	INCLUDEPATH += $$VTK_SRCDIR\IMAGING
	INCLUDEPATH += $$VTK_SRCDIR\IO
	INCLUDEPATH += $$VTK_SRCDIR\RENDER~1
	INCLUDEPATH += $$VTK_DIR
	DEFINES += _USE_MATH_DEFINES
    }
    # #######################
  }
}
else {
      message("Configuring for Debian package")
      INCLUDEPATH += /usr/include/vtk-5.4/
}