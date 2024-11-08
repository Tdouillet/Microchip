#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=HARDWARE/device_config.c HARDWARE/mcc.c HARDWARE/pin_manager.c APPLICATION/main.c DRIVERS/lidar.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/HARDWARE/device_config.p1 ${OBJECTDIR}/HARDWARE/mcc.p1 ${OBJECTDIR}/HARDWARE/pin_manager.p1 ${OBJECTDIR}/APPLICATION/main.p1 ${OBJECTDIR}/DRIVERS/lidar.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/HARDWARE/device_config.p1.d ${OBJECTDIR}/HARDWARE/mcc.p1.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d ${OBJECTDIR}/APPLICATION/main.p1.d ${OBJECTDIR}/DRIVERS/lidar.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/HARDWARE/device_config.p1 ${OBJECTDIR}/HARDWARE/mcc.p1 ${OBJECTDIR}/HARDWARE/pin_manager.p1 ${OBJECTDIR}/APPLICATION/main.p1 ${OBJECTDIR}/DRIVERS/lidar.p1

# Source Files
SOURCEFILES=HARDWARE/device_config.c HARDWARE/mcc.c HARDWARE/pin_manager.c APPLICATION/main.c DRIVERS/lidar.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F57Q43
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/HARDWARE/device_config.p1: HARDWARE/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/device_config.p1 HARDWARE/device_config.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/device_config.d ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/mcc.p1: HARDWARE/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/mcc.p1 HARDWARE/mcc.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/mcc.d ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/pin_manager.p1: HARDWARE/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/pin_manager.p1 HARDWARE/pin_manager.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/pin_manager.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/APPLICATION/main.p1: APPLICATION/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/APPLICATION" 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/APPLICATION/main.p1 APPLICATION/main.c 
	@-${MV} ${OBJECTDIR}/APPLICATION/main.d ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/APPLICATION/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/DRIVERS/lidar.p1: DRIVERS/lidar.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/DRIVERS" 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/DRIVERS/lidar.p1 DRIVERS/lidar.c 
	@-${MV} ${OBJECTDIR}/DRIVERS/lidar.d ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/DRIVERS/lidar.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/HARDWARE/device_config.p1: HARDWARE/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/device_config.p1 HARDWARE/device_config.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/device_config.d ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/mcc.p1: HARDWARE/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/mcc.p1 HARDWARE/mcc.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/mcc.d ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/pin_manager.p1: HARDWARE/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/pin_manager.p1 HARDWARE/pin_manager.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/pin_manager.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/APPLICATION/main.p1: APPLICATION/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/APPLICATION" 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/APPLICATION/main.p1 APPLICATION/main.c 
	@-${MV} ${OBJECTDIR}/APPLICATION/main.d ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/APPLICATION/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/DRIVERS/lidar.p1: DRIVERS/lidar.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/DRIVERS" 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/DRIVERS/lidar.p1 DRIVERS/lidar.c 
	@-${MV} ${OBJECTDIR}/DRIVERS/lidar.d ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/DRIVERS/lidar.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

