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
SOURCEFILES_QUOTED_IF_SPACED=HARDWARE/device_config.c HARDWARE/mcc.c HARDWARE/pin_manager.c APPLICATION/main.c DRIVERS/lidar.c HARDWARE/uart.c HARDWARE/ISR.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/HARDWARE/device_config.p1 ${OBJECTDIR}/HARDWARE/mcc.p1 ${OBJECTDIR}/HARDWARE/pin_manager.p1 ${OBJECTDIR}/APPLICATION/main.p1 ${OBJECTDIR}/DRIVERS/lidar.p1 ${OBJECTDIR}/HARDWARE/uart.p1 ${OBJECTDIR}/HARDWARE/ISR.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/HARDWARE/device_config.p1.d ${OBJECTDIR}/HARDWARE/mcc.p1.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d ${OBJECTDIR}/APPLICATION/main.p1.d ${OBJECTDIR}/DRIVERS/lidar.p1.d ${OBJECTDIR}/HARDWARE/uart.p1.d ${OBJECTDIR}/HARDWARE/ISR.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/HARDWARE/device_config.p1 ${OBJECTDIR}/HARDWARE/mcc.p1 ${OBJECTDIR}/HARDWARE/pin_manager.p1 ${OBJECTDIR}/APPLICATION/main.p1 ${OBJECTDIR}/DRIVERS/lidar.p1 ${OBJECTDIR}/HARDWARE/uart.p1 ${OBJECTDIR}/HARDWARE/ISR.p1

# Source Files
SOURCEFILES=HARDWARE/device_config.c HARDWARE/mcc.c HARDWARE/pin_manager.c APPLICATION/main.c DRIVERS/lidar.c HARDWARE/uart.c HARDWARE/ISR.c



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
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/device_config.p1 HARDWARE/device_config.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/device_config.d ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/mcc.p1: HARDWARE/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/mcc.p1 HARDWARE/mcc.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/mcc.d ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/pin_manager.p1: HARDWARE/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/pin_manager.p1 HARDWARE/pin_manager.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/pin_manager.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/APPLICATION/main.p1: APPLICATION/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/APPLICATION" 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/APPLICATION/main.p1 APPLICATION/main.c 
	@-${MV} ${OBJECTDIR}/APPLICATION/main.d ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/APPLICATION/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/DRIVERS/lidar.p1: DRIVERS/lidar.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/DRIVERS" 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/DRIVERS/lidar.p1 DRIVERS/lidar.c 
	@-${MV} ${OBJECTDIR}/DRIVERS/lidar.d ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/DRIVERS/lidar.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/uart.p1: HARDWARE/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/uart.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/uart.p1 HARDWARE/uart.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/uart.d ${OBJECTDIR}/HARDWARE/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/ISR.p1: HARDWARE/ISR.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/ISR.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/ISR.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/ISR.p1 HARDWARE/ISR.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/ISR.d ${OBJECTDIR}/HARDWARE/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/HARDWARE/device_config.p1: HARDWARE/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/device_config.p1 HARDWARE/device_config.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/device_config.d ${OBJECTDIR}/HARDWARE/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/mcc.p1: HARDWARE/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/mcc.p1 HARDWARE/mcc.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/mcc.d ${OBJECTDIR}/HARDWARE/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/pin_manager.p1: HARDWARE/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/pin_manager.p1 HARDWARE/pin_manager.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/pin_manager.d ${OBJECTDIR}/HARDWARE/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/APPLICATION/main.p1: APPLICATION/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/APPLICATION" 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${RM} ${OBJECTDIR}/APPLICATION/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/APPLICATION/main.p1 APPLICATION/main.c 
	@-${MV} ${OBJECTDIR}/APPLICATION/main.d ${OBJECTDIR}/APPLICATION/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/APPLICATION/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/DRIVERS/lidar.p1: DRIVERS/lidar.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/DRIVERS" 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${RM} ${OBJECTDIR}/DRIVERS/lidar.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/DRIVERS/lidar.p1 DRIVERS/lidar.c 
	@-${MV} ${OBJECTDIR}/DRIVERS/lidar.d ${OBJECTDIR}/DRIVERS/lidar.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/DRIVERS/lidar.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/uart.p1: HARDWARE/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/uart.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/uart.p1 HARDWARE/uart.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/uart.d ${OBJECTDIR}/HARDWARE/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HARDWARE/ISR.p1: HARDWARE/ISR.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/HARDWARE" 
	@${RM} ${OBJECTDIR}/HARDWARE/ISR.p1.d 
	@${RM} ${OBJECTDIR}/HARDWARE/ISR.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/HARDWARE/ISR.p1 HARDWARE/ISR.c 
	@-${MV} ${OBJECTDIR}/HARDWARE/ISR.d ${OBJECTDIR}/HARDWARE/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HARDWARE/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"DRIVERS" -I"HARDWARE" -I"APPLICATION" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/DAPII_LIDAR_PIC18.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
