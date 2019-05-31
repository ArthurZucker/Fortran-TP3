# ---------------------------------------------------------------------
# Compiler selection
# ---------------------------------------------------------------------

GFOR = gfortran

# ---------------------------------------------------------------------
# Compiler options
# ---------------------------------------------------------------------

GFOROPT = -Wall

# ---------------------------------------------------------------------
# FILES TO COMPILE
# ---------------------------------------------------------------------

OBJ_FILES = clsIntervalle.o clsFuncGrapher.o clsNumFonction.o clsDerivateur.o  main.o \


#----------------------------------------------------------------------
# PATHS
#----------------------------------------------------------------------

SRCDIR =


#----------------------------------------------------------------------
# LIBS
#---------------------------------------------------------------------

LIBS =

INCL =

#---------------------------------------------------------------------
# TARGETS
#---------------------------------------------------------------------

EXE = main

TO_CLEAN =  $(EXE) *~ $(OBJ_FILES) *.mod

#------------------------------------------------------------
# AutoCompiling
#------------------------------------------------------------

all: $(EXE)

.SUFFIXES:  .f08 .o

$(EXE): $(OBJ_FILES)
	bla=;\
	for file in $(OBJ_FILES); do bla="$$bla `echo $$file`" ; done; \
	$(GFOR) $(GFOROPT) -o $@ $$bla $(LIBS)

clean:
	rm -rf $(TO_CLEAN)

.f08.o:
	$(GFOR) $(GFOROPT) $(INCL) -c -o $@ `test -f '$<' || echo '$(SRCDIR)/'`$<
