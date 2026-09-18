
#pragma once
#pragma once
#include <format>
#include <iostream>
#include <Windows.h>
#include <ntstatus.h>
import strformat, winim

#ifndef RTL_CLONE_PROCESS_FLAGS_CREATE_SUSPENDED
const RTL_CLONE_PROCESS_FLAGS_CREATE_SUSPENDED*: ULONG = 0x00000001.ULONG
#endif

#ifndef RTL_CLONE_PROCESS_FLAGS_INHERIT_HANDLES
const RTL_CLONE_PROCESS_FLAGS_INHERIT_HANDLES*: ULONG = 0x00000002.ULONG
#endif

#ifndef RTL_CLONE_PROCESS_FLAGS_NO_SYNCHRONIZE
const RTL_CLONE_PROCESS_FLAGS_NO_SYNCHRONIZE*: ULONG = 0x00000004.ULONG ## don't update synchronization objects
#endif

type  
    T_CLIENT_ID* = object
        UniqueProcess*: HANDLE
        UniqueThread*: HANDLE


    T_RTLP_PROCESS_REFLECTION_REFLECTION_INFORMATION* = object
        ReflectionProcessHandle*: HANDLE
        ReflectionThreadHandle*: HANDLE
        ReflectionClientId*: T_CLIENT_ID

    ReflectionContext* = object
        unk1*: DWORD64
        Flags*: ULONG
        StartRoutine*: PVOID
        StartContext*: PVOID
        unk2*: PVOID
        unk3*: PVOID
        EventHandle*: PVOID
        
    RtlCreateProcessReflectionFunc* = proc (
        ProcessHandle: HANDLE,
        Flags: ULONG,
        StartRoutine: PVOID,
        StartContext: PVOID,
        EventHandle: HANDLE,
        ReflectionInformation: T_RTLP_PROCESS_REFLECTION_REFLECTION_INFORMATION
        ): NTSTATUS {. stdcall, gcsafe .}
   
## IDA Data: the internal struct for RtlCreateProcessReflection. gets passed to RtlpProcessReflectionStartup
    
        
