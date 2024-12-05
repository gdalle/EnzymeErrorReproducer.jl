using Enzyme
Enzyme.Compiler.DumpPreEnzyme[] = true
using EnzymeErrorReproducer

x, dx = inputs()
myhvp(f_cartesian, x, dx)

# copy-paste the LLVM blurb into two module strings below

llvm_module1 = """
; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128-ni:10:11:12:13"
target triple = "x86_64-linux-gnu"

@jl_undefref_exception = external local_unnamed_addr constant {}*

; Function Attrs: noinline noreturn
define internal fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer}" "enzymejl_parmtype"="127938075238032" "enzymejl_parmtype_ref"="1" %1) unnamed_addr #0 !dbg !9 {
top:
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %2 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %3 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %4, align 8, !tbaa !17
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #17, !dbg !19
  fence syncscope("singlethread") seq_cst
  %5 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938075238032 to {}*) to {} addrspace(10)*)) #18, !dbg !19
  %6 = getelementptr inbounds [1 x i64], [1 x i64] addrspace(11)* %1, i64 0, i64 0, !dbg !19
  %7 = bitcast {} addrspace(10)* %5 to i64 addrspace(10)*, !dbg !19, !enzyme_inactive !12
  %8 = load i64, i64 addrspace(11)* %6, align 8, !dbg !19, !tbaa !17, !alias.scope !20, !noalias !23, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  store i64 %8, i64 addrspace(10)* %7, align 8, !dbg !19, !tbaa !30, !alias.scope !34, !noalias !35
  %9 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938098682144 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %0, {} addrspace(10)* nofree nonnull %5) #19, !dbg !19
  %10 = addrspacecast {} addrspace(10)* %9 to {} addrspace(12)*, !dbg !19
  call void @ijl_throw({} addrspace(12)* %10) #20, !dbg !19
  unreachable, !dbg !19
}

; Function Attrs: nofree memory(none)
declare {}*** @julia.get_pgcstack() local_unnamed_addr #1

; Function Attrs: nofree memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @julia.safepoint(i64*) local_unnamed_addr #2

; Function Attrs: nofree
declare nonnull {} addrspace(10)* @ijl_invoke({} addrspace(10)*, {} addrspace(10)** nocapture readonly, i32, {} addrspace(10)*) #3

; Function Attrs: nofree
declare nonnull {} addrspace(10)* @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite)
declare noalias nonnull {} addrspace(10)* @julia.gc_alloc_obj({}*, i64, {} addrspace(10)*) local_unnamed_addr #4

; Function Attrs: noreturn
declare void @ijl_throw({} addrspace(12)*) local_unnamed_addr #5

; Function Attrs: noreturn
declare void @ijl_bounds_error_int({} addrspace(12)*, i64) local_unnamed_addr #6

; Function Attrs: norecurse nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* nocapture noundef nonnull readnone, {} addrspace(10)** noundef nonnull readnone) local_unnamed_addr #7

; Function Attrs: noinline noreturn
define internal fastcc void @julia_throw_boundserror_22262({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, [2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Integer, [-1,9]:Integer, [-1,10]:Integer, [-1,11]:Integer, [-1,12]:Integer, [-1,13]:Integer, [-1,14]:Integer, [-1,15]:Integer}" "enzymejl_parmtype"="127938116547552" "enzymejl_parmtype_ref"="1" %1) unnamed_addr #8 !dbg !38 {
top:
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %2 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %3 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %4, align 8, !tbaa !17
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #17, !dbg !39
  fence syncscope("singlethread") seq_cst
  %5 = call noalias nonnull align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938116547552 to {}*) to {} addrspace(10)*)) #18, !dbg !39
  %6 = bitcast {} addrspace(10)* %5 to i8 addrspace(10)*, !dbg !39, !enzyme_inactive !12
  %7 = bitcast [2 x i64] addrspace(11)* %1 to i8 addrspace(11)*, !dbg !39, !enzyme_inactive !12
  call void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* nocapture nofree noundef nonnull align 8 dereferenceable(16) %6, i8 addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %7, i64 noundef 16, i1 noundef false), !dbg !39, !tbaa !40, !alias.scope !41, !noalias !42, !enzyme_truetype !43
  %8 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938098633184 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %0, {} addrspace(10)* nofree nonnull %5) #19, !dbg !39
  %9 = addrspacecast {} addrspace(10)* %8 to {} addrspace(12)*, !dbg !39
  call void @ijl_throw({} addrspace(12)* %9) #20, !dbg !39
  unreachable, !dbg !39
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* noalias nocapture writeonly, i8 addrspace(11)* noalias nocapture readonly, i64, i1 immarg) #9

define "enzyme_type"="{[-1]:Float@double}" double @julia_f_cartesian_22225({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0) local_unnamed_addr #10 !dbg !44 {
top:
  %1 = alloca [2 x i64], align 8
  %2 = alloca [1 x i64], align 8
  %3 = alloca [1 x i64], align 8
  %4 = alloca [1 x i64], align 8
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task199 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %5 = bitcast {}*** %current_task199 to {}*
  %ptls_field100 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %6 = bitcast {}*** %ptls_field100 to i64***
  %ptls_load101102 = load i64**, i64*** %6, align 8, !tbaa !13
  %7 = getelementptr inbounds i64*, i64** %ptls_load101102, i64 2
  %safepoint = load i64*, i64** %7, align 8, !tbaa !17
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint), !dbg !46
  fence syncscope("singlethread") seq_cst
  %8 = bitcast {} addrspace(10)* %0 to i8 addrspace(10)*, !dbg !47
  %9 = addrspacecast i8 addrspace(10)* %8 to i8 addrspace(11)*, !dbg !47
  %10 = getelementptr inbounds i8, i8 addrspace(11)* %9, i64 16, !dbg !47
  %.sroa.079.0..sroa_idx = bitcast i8 addrspace(11)* %10 to i64 addrspace(11)*, !dbg !47
  %.sroa.079.0.copyload = load i64, i64 addrspace(11)* %.sroa.079.0..sroa_idx, align 8, !dbg !47, !tbaa !40, !alias.scope !55, !noalias !56, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %.sroa.482.0..sroa_idx83 = getelementptr inbounds i8, i8 addrspace(11)* %9, i64 24, !dbg !47
  %11 = bitcast i8 addrspace(11)* %.sroa.482.0..sroa_idx83 to i64 addrspace(11)*, !dbg !47
  %.sroa.1.0.copyload = load i64, i64 addrspace(11)* %11, align 8, !dbg !47, !tbaa !40, !alias.scope !55, !noalias !56, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.sroa.079.0.copyload, i64 %.sroa.1.0.copyload), !dbg !57
  %13 = extractvalue { i64, i1 } %12, 0, !dbg !57
  %14 = extractvalue { i64, i1 } %12, 1, !dbg !57
  %15 = icmp ugt i64 %.sroa.079.0.copyload, 9223372036854775806, !dbg !64
  %16 = or i1 %15, %14, !dbg !64
  %17 = icmp ugt i64 %.sroa.1.0.copyload, 9223372036854775806, !dbg !65
  %18 = or i1 %17, %16, !dbg !65
  br i1 %18, label %L13, label %L17, !dbg !66

L13:                                              ; preds = %top
  %19 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657840 to {}*) to {} addrspace(10)*)) #18, !dbg !66
  %20 = bitcast {} addrspace(10)* %19 to [1 x {} addrspace(10)*] addrspace(10)*, !dbg !66, !enzyme_inactive !12
  %21 = getelementptr [1 x {} addrspace(10)*], [1 x {} addrspace(10)*] addrspace(10)* %20, i64 0, i64 0, !dbg !66
  store {} addrspace(10)* addrspacecast ({}* inttoptr (i64 127938155009344 to {}*) to {} addrspace(10)*), {} addrspace(10)* addrspace(10)* %21, align 8, !dbg !66, !tbaa !30, !alias.scope !34, !noalias !35
  %22 = addrspacecast {} addrspace(10)* %19 to {} addrspace(12)*, !dbg !66, !enzyme_inactive !12
  call void @ijl_throw({} addrspace(12)* %22) #20, !dbg !66
  unreachable, !dbg !66

L17:                                              ; preds = %top
  %.not = icmp eq i64 %13, 0, !dbg !67
  br i1 %.not, label %L19, label %L21, !dbg !67

L19:                                              ; preds = %L17
  %23 = load atomic {} addrspace(10)*, {} addrspace(10)** inttoptr (i64 127938077110288 to {} addrspace(10)**) unordered, align 16, !dbg !71, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !72, !enzymejl_source_type_Memory\7BFloat64\7D !12, !enzymejl_byref_BITS_REF !12
  %.not103 = icmp eq {} addrspace(10)* %23, null, !dbg !71
  br i1 %.not103, label %fail, label %L23, !dbg !71

L21:                                              ; preds = %L17
  %24 = call noalias "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Pointer, [-1,8,-1]:Float@double}" {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077110256 to {}*) to {} addrspace(10)*), i64 %13) #21, !dbg !76
  br label %L23, !dbg !76

L23:                                              ; preds = %L19, %L21
  %value_phi = phi {} addrspace(10)* [ %24, %L21 ], [ %23, %L19 ]
  %25 = bitcast {} addrspace(10)* %value_phi to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !77
  %26 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %25 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !77
  %27 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %26, i64 0, i32 1, !dbg !77
  %28 = bitcast {} addrspace(10)** addrspace(11)* %27 to i8* addrspace(11)*, !dbg !77
  %29 = load i8*, i8* addrspace(11)* %28, align 8, !dbg !77, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12
  %30 = call noalias nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 32, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938216542032 to {}*) to {} addrspace(10)*)) #18, !dbg !62
  %31 = bitcast {} addrspace(10)* %30 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !62
  %32 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %31 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !62
  %.repack = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %32, i64 0, i32 0, !dbg !62
  store i8* %29, i8* addrspace(11)* %.repack, align 8, !dbg !62, !tbaa !80, !alias.scope !83, !noalias !84
  %.repack104 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %32, i64 0, i32 1, !dbg !62
  store {} addrspace(10)* %value_phi, {} addrspace(10)* addrspace(11)* %.repack104, align 8, !dbg !62, !tbaa !80, !alias.scope !83, !noalias !84
  %33 = bitcast {} addrspace(10)* %30 to i8 addrspace(10)*, !dbg !62
  %34 = addrspacecast i8 addrspace(10)* %33 to i8 addrspace(11)*, !dbg !62
  %35 = getelementptr inbounds i8, i8 addrspace(11)* %34, i64 16, !dbg !62
  %.sroa.070.0..sroa_idx = bitcast i8 addrspace(11)* %35 to i64 addrspace(11)*, !dbg !62
  store i64 %.sroa.079.0.copyload, i64 addrspace(11)* %.sroa.070.0..sroa_idx, align 8, !dbg !62, !tbaa !40, !alias.scope !85, !noalias !56
  %.sroa.271.0..sroa_idx72 = getelementptr inbounds i8, i8 addrspace(11)* %34, i64 24, !dbg !62
  %36 = bitcast i8 addrspace(11)* %.sroa.271.0..sroa_idx72 to i64 addrspace(11)*, !dbg !62
  store i64 %.sroa.1.0.copyload, i64 addrspace(11)* %36, align 8, !dbg !62, !tbaa !40, !alias.scope !85, !noalias !56
  %37 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*
  %38 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %37 to { i8*, {} addrspace(10)* } addrspace(11)*
  %39 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*
  %40 = addrspacecast i8* addrspace(10)* %39 to i8* addrspace(11)*
  %41 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %38, i64 0, i32 1
  %42 = icmp eq i64 %.sroa.1.0.copyload, 0
  %43 = icmp ult i64 %.sroa.1.0.copyload, 2
  %44 = icmp ult i64 %.sroa.1.0.copyload, 3
  %45 = shl nuw i64 %.sroa.079.0.copyload, 1
  br label %L31, !dbg !62

L31:                                              ; preds = %load14.2, %L23
  %value_phi4 = phi i64 [ 1, %L23 ], [ %182, %load14.2 ]
  %46 = add nsw i64 %value_phi4, -1
  %47 = icmp uge i64 %46, %.sroa.079.0.copyload
  %48 = load i8*, i8* addrspace(11)* %40, align 8, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12, !enzyme_nocache !12
  %49 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %41, align 8, !enzyme_type !72, !enzymejl_source_type_Memory\7BFloat64\7D !12, !enzymejl_byref_MUT_REF !12
  %50 = bitcast i8* %48 to double*
  %51 = bitcast {} addrspace(10)* %49 to { i64, {} addrspace(10)** } addrspace(10)*
  %52 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %51 to { i64, {} addrspace(10)** } addrspace(11)*
  %53 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %52, i64 0, i32 1
  %54 = bitcast {} addrspace(10)** addrspace(11)* %53 to i8* addrspace(11)*
  %55 = bitcast i8* %48 to {} addrspace(10)**
  %56 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %49, {} addrspace(10)** noundef %55), !dbg !86
  %57 = load i8*, i8* addrspace(11)* %.repack, align 8, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12, !enzyme_nocache !12
  %58 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %.repack104, align 8, !enzyme_type !72, !enzymejl_source_type_Memory\7BFloat64\7D !12, !enzymejl_byref_MUT_REF !12
  %59 = bitcast {} addrspace(10)* %58 to i64 addrspace(10)*
  %60 = addrspacecast i64 addrspace(10)* %59 to i64 addrspace(11)*
  %61 = bitcast i8* %57 to double*
  %62 = bitcast {} addrspace(10)* %58 to { i64, {} addrspace(10)** } addrspace(10)*
  %63 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %62 to { i64, {} addrspace(10)** } addrspace(11)*
  %64 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %63, i64 0, i32 1
  %65 = bitcast {} addrspace(10)** addrspace(11)* %64 to i8* addrspace(11)*
  %66 = bitcast i8* %57 to {} addrspace(10)**
  %67 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %58, {} addrspace(10)** noundef %66), !dbg !86
  %.not108 = or i1 %42, %47, !dbg !87
  br i1 %.not108, label %L60, label %L63, !dbg !87

L60:                                              ; preds = %load14.1, %load14, %L31
  %value_phi4.lcssa = phi i64 [ 1, %load14.1 ], [ 1, %load14 ], [ %value_phi4, %L31 ]
  %value_phi6.lcssa = phi i64 [ 3, %load14.1 ], [ 2, %load14 ], [ 1, %L31 ]
  %68 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 1
  %69 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 0
  store i64 %value_phi4.lcssa, i64* %69, align 8, !dbg !93, !tbaa !94, !alias.scope !96, !noalias !97
  store i64 %value_phi6.lcssa, i64* %68, align 8, !dbg !93, !tbaa !94, !alias.scope !96, !noalias !97
  %70 = addrspacecast [2 x i64]* %1 to [2 x i64] addrspace(11)*, !dbg !87
  call fastcc void @julia_throw_boundserror_22262({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %70) #20, !dbg !87
  unreachable, !dbg !87

L63:                                              ; preds = %L31
  %71 = bitcast {} addrspace(10)* %49 to i64 addrspace(10)*
  %72 = addrspacecast i64 addrspace(10)* %71 to i64 addrspace(11)*
  %73 = load i64, i64 addrspace(11)* %72, align 8, !dbg !98, !tbaa !101, !alias.scope !83, !noalias !103, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %.not109 = icmp ult i64 %46, %73, !dbg !98
  br i1 %.not109, label %L87, label %L84, !dbg !98

L84:                                              ; preds = %L63.2, %L63.1, %L63
  %.lcssa223 = phi i64 [ %value_phi4, %L63 ], [ %140, %L63.1 ], [ %161, %L63.2 ], !dbg !104
  %74 = getelementptr inbounds [1 x i64], [1 x i64]* %4, i64 0, i64 0, !dbg !98
  store i64 %.lcssa223, i64* %74, align 8, !dbg !98, !tbaa !94, !alias.scope !96, !noalias !97
  %75 = addrspacecast [1 x i64]* %4 to [1 x i64] addrspace(11)*, !dbg !98
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %75) #20, !dbg !98
  unreachable, !dbg !98

L87:                                              ; preds = %L63
  %76 = shl nuw i64 %73, 1, !dbg !115
  %77 = add i64 %73, %46, !dbg !115
  %.not110 = icmp ult i64 %77, %76, !dbg !115
  %78 = getelementptr inbounds double, double* %50, i64 %46, !dbg !115
  %79 = load i8*, i8* addrspace(11)* %54, align 8, !dbg !115, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12
  %80 = ptrtoint i8* %79 to i64, !dbg !115
  %81 = ptrtoint double* %78 to i64, !dbg !115
  %82 = sub i64 %81, %80, !dbg !115
  %83 = shl nuw nsw i64 %73, 3, !dbg !115
  %84 = icmp ult i64 %82, %83, !dbg !115
  %85 = and i1 %.not110, %84, !dbg !115
  br i1 %85, label %load, label %oob, !dbg !115

L159:                                             ; preds = %load14.2
  %86 = bitcast {} addrspace(10)* addrspace(13)* %67 to double addrspace(13)*, !dbg !116
  br i1 %.not, label %L262, label %L170, !dbg !118

L170:                                             ; preds = %L159
  %.not120 = icmp eq i64 %13, 1, !dbg !124
  br i1 %.not120, label %L186, label %L191, !dbg !127

L186:                                             ; preds = %L170
  %87 = ptrtoint i8* %57 to i64, !dbg !128
  %88 = sub i64 %87, %127, !dbg !128
  %89 = icmp ult i64 %88, %130, !dbg !128
  br i1 %89, label %load26, label %oob22, !dbg !128

L191:                                             ; preds = %L170
  %90 = icmp sgt i64 %13, 15, !dbg !130
  br i1 %90, label %L257, label %L207, !dbg !132

L207:                                             ; preds = %L191
  %91 = ptrtoint i8* %57 to i64, !dbg !133
  %92 = sub i64 %91, %127, !dbg !133
  %93 = icmp ult i64 %92, %130, !dbg !133
  br i1 %93, label %load32, label %oob28, !dbg !133

L222:                                             ; preds = %load32
  %94 = getelementptr inbounds [1 x i64], [1 x i64]* %3, i64 0, i64 0, !dbg !135
  store i64 2, i64* %94, align 8, !dbg !135, !tbaa !94, !alias.scope !96, !noalias !97
  %95 = addrspacecast [1 x i64]* %3 to [1 x i64] addrspace(11)*, !dbg !135
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %30, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %95) #20, !dbg !135
  unreachable, !dbg !135

L225:                                             ; preds = %load32
  %96 = add nuw nsw i64 %122, 1, !dbg !137
  %.not127 = icmp ult i64 %96, %123, !dbg !137
  %97 = getelementptr inbounds i8, i8* %57, i64 8, !dbg !137
  %98 = ptrtoint i8* %97 to i64, !dbg !137
  %99 = sub i64 %98, %127, !dbg !137
  %100 = icmp ult i64 %99, %130, !dbg !137
  %101 = and i1 %.not127, %100, !dbg !137
  br i1 %101, label %load37, label %oob33, !dbg !137

L235:                                             ; preds = %load37, %load44
  %value_phi39180 = phi i64 [ %102, %load44 ], [ 2, %load37 ]
  %value_phi38179 = phi double [ %205, %load44 ], [ %198, %load37 ]
  %102 = add nuw nsw i64 %value_phi39180, 1, !dbg !138
  %exitcond.not = icmp eq i64 %value_phi39180, %122, !dbg !140
  br i1 %exitcond.not, label %L247, label %L250, !dbg !140

L247:                                             ; preds = %L235
  %103 = getelementptr inbounds [1 x i64], [1 x i64]* %2, i64 0, i64 0, !dbg !140
  store i64 %102, i64* %103, align 8, !dbg !140, !tbaa !94, !alias.scope !96, !noalias !97
  %104 = addrspacecast [1 x i64]* %2 to [1 x i64] addrspace(11)*, !dbg !140
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %30, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %104) #20, !dbg !140
  unreachable, !dbg !140

L250:                                             ; preds = %L235
  %105 = add nuw nsw i64 %value_phi39180, %122, !dbg !141
  %.not133 = icmp ult i64 %105, %123, !dbg !141
  %106 = getelementptr inbounds double, double* %61, i64 %value_phi39180, !dbg !141
  %107 = ptrtoint double* %106 to i64, !dbg !141
  %108 = sub i64 %107, %127, !dbg !141
  %109 = icmp ult i64 %108, %130, !dbg !141
  %110 = and i1 %.not133, %109, !dbg !141
  br i1 %110, label %load44, label %oob40, !dbg !141

L257:                                             ; preds = %L191
  %111 = call fastcc double @julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %30, i64 noundef signext 1, i64 signext %13), !dbg !142
  br label %L262, !dbg !145

L262:                                             ; preds = %load44, %load37, %load26, %L257, %L159
  %value_phi21 = phi double [ %186, %load26 ], [ %111, %L257 ], [ 0.000000e+00, %L159 ], [ %198, %load37 ], [ %205, %load44 ]
  ret double %value_phi21, !dbg !123

fail:                                             ; preds = %L19
  %112 = load {}*, {}** @jl_undefref_exception, align 8, !dbg !71, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12
  %113 = addrspacecast {}* %112 to {} addrspace(12)*, !dbg !71
  call void @ijl_throw({} addrspace(12)* %113) #20, !dbg !71
  unreachable, !dbg !71

oob:                                              ; preds = %L87.2, %L87.1, %L87
  %.lcssa224 = phi i64 [ %value_phi4, %L87 ], [ %140, %L87.1 ], [ %161, %L87.2 ], !dbg !104
  %114 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !115
  %115 = bitcast {} addrspace(10)* %114 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !115
  %.repack111 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %115, i64 0, i32 0, !dbg !115
  store i8* %48, i8* addrspace(10)* %.repack111, align 8, !dbg !115, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack112 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %115, i64 0, i32 1, !dbg !115
  store {} addrspace(10)* %49, {} addrspace(10)* addrspace(10)* %.repack112, align 8, !dbg !115, !tbaa !30, !alias.scope !34, !noalias !35
  %116 = addrspacecast {} addrspace(10)* %114 to {} addrspace(12)*, !dbg !115
  call void @ijl_bounds_error_int({} addrspace(12)* %116, i64 %.lcssa224) #20, !dbg !115
  unreachable, !dbg !115

load:                                             ; preds = %L87
  %117 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %56, i64 %46, !dbg !115
  %118 = bitcast {} addrspace(10)* addrspace(13)* %117 to double addrspace(13)*, !dbg !115
  %119 = load double, double addrspace(13)* %118, align 8, !dbg !115, !tbaa !149, !alias.scope !34, !noalias !151
  %120 = fmul double %119, %119, !dbg !152
  %121 = fmul double %119, %120, !dbg !152
  %122 = load i64, i64 addrspace(11)* %60, align 8, !dbg !116, !tbaa !101, !range !161, !alias.scope !83, !noalias !103, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %123 = shl nuw nsw i64 %122, 1, !dbg !116
  %124 = add i64 %122, %46, !dbg !116
  %.not114 = icmp ult i64 %124, %123, !dbg !116
  %125 = getelementptr inbounds double, double* %61, i64 %46, !dbg !116
  %126 = load i8*, i8* addrspace(11)* %65, align 8, !dbg !116, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12
  %127 = ptrtoint i8* %126 to i64, !dbg !116
  %128 = ptrtoint double* %125 to i64, !dbg !116
  %129 = sub i64 %128, %127, !dbg !116
  %130 = shl nuw nsw i64 %122, 3, !dbg !116
  %131 = icmp ult i64 %129, %130, !dbg !116
  %132 = and i1 %.not114, %131, !dbg !116
  br i1 %132, label %idxend12, label %oob10, !dbg !116

oob10:                                            ; preds = %load.2, %load.1, %load
  %.lcssa225 = phi i64 [ %value_phi4, %load ], [ %140, %load.1 ], [ %161, %load.2 ], !dbg !104
  %133 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !116
  %134 = bitcast {} addrspace(10)* %133 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !116
  %.repack115 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %134, i64 0, i32 0, !dbg !116
  store i8* %57, i8* addrspace(10)* %.repack115, align 8, !dbg !116, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack116 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %134, i64 0, i32 1, !dbg !116
  store {} addrspace(10)* %58, {} addrspace(10)* addrspace(10)* %.repack116, align 8, !dbg !116, !tbaa !30, !alias.scope !34, !noalias !35
  %135 = addrspacecast {} addrspace(10)* %133 to {} addrspace(12)*, !dbg !116
  call void @ijl_bounds_error_int({} addrspace(12)* %135, i64 %.lcssa225) #20, !dbg !116
  unreachable, !dbg !116

idxend12:                                         ; preds = %load
  %136 = icmp eq i64 %122, 0, !dbg !116
  br i1 %136, label %oob13, label %load14, !dbg !116

oob13:                                            ; preds = %idxend12
  %137 = addrspacecast {} addrspace(10)* %58 to {} addrspace(12)*, !dbg !116
  call void @ijl_bounds_error_int({} addrspace(12)* noundef %137, i64 noundef 1) #20, !dbg !116
  unreachable, !dbg !116

load14:                                           ; preds = %idxend12
  %138 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %67, i64 %46, !dbg !116
  %139 = bitcast {} addrspace(10)* addrspace(13)* %138 to double addrspace(13)*, !dbg !116
  store double %121, double addrspace(13)* %139, align 8, !dbg !116, !tbaa !149, !alias.scope !34, !noalias !35
  br i1 %43, label %L60, label %L63.1, !dbg !87

L63.1:                                            ; preds = %load14
  %140 = add i64 %value_phi4, %.sroa.079.0.copyload, !dbg !104
  %141 = add i64 %140, -1, !dbg !98
  %.not109.1 = icmp ult i64 %141, %73, !dbg !98
  br i1 %.not109.1, label %L87.1, label %L84, !dbg !98

L87.1:                                            ; preds = %L63.1
  %142 = add i64 %73, %141, !dbg !115
  %.not110.1 = icmp ult i64 %142, %76, !dbg !115
  %143 = getelementptr inbounds double, double* %50, i64 %141, !dbg !115
  %144 = ptrtoint double* %143 to i64, !dbg !115
  %145 = sub i64 %144, %80, !dbg !115
  %146 = icmp ult i64 %145, %83, !dbg !115
  %147 = and i1 %.not110.1, %146, !dbg !115
  br i1 %147, label %load.1, label %oob, !dbg !115

load.1:                                           ; preds = %L87.1
  %148 = add i64 %122, %141, !dbg !116
  %.not114.1 = icmp ult i64 %148, %123, !dbg !116
  %149 = getelementptr inbounds double, double* %61, i64 %141, !dbg !116
  %150 = ptrtoint double* %149 to i64, !dbg !116
  %151 = sub i64 %150, %127, !dbg !116
  %152 = icmp ult i64 %151, %130, !dbg !116
  %153 = and i1 %.not114.1, %152, !dbg !116
  br i1 %153, label %load14.1, label %oob10, !dbg !116

load14.1:                                         ; preds = %load.1
  %154 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %56, i64 %141, !dbg !115
  %155 = bitcast {} addrspace(10)* addrspace(13)* %154 to double addrspace(13)*, !dbg !115
  %156 = load double, double addrspace(13)* %155, align 8, !dbg !115, !tbaa !149, !alias.scope !34, !noalias !151
  %157 = fmul double %156, %156, !dbg !152
  %158 = fmul double %156, %157, !dbg !152
  %159 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %67, i64 %141, !dbg !116
  %160 = bitcast {} addrspace(10)* addrspace(13)* %159 to double addrspace(13)*, !dbg !116
  store double %158, double addrspace(13)* %160, align 8, !dbg !116, !tbaa !149, !alias.scope !34, !noalias !35
  br i1 %44, label %L60, label %L63.2, !dbg !87

L63.2:                                            ; preds = %load14.1
  %161 = add i64 %value_phi4, %45, !dbg !104
  %162 = add i64 %161, -1, !dbg !98
  %.not109.2 = icmp ult i64 %162, %73, !dbg !98
  br i1 %.not109.2, label %L87.2, label %L84, !dbg !98

L87.2:                                            ; preds = %L63.2
  %163 = add i64 %73, %162, !dbg !115
  %.not110.2 = icmp ult i64 %163, %76, !dbg !115
  %164 = getelementptr inbounds double, double* %50, i64 %162, !dbg !115
  %165 = ptrtoint double* %164 to i64, !dbg !115
  %166 = sub i64 %165, %80, !dbg !115
  %167 = icmp ult i64 %166, %83, !dbg !115
  %168 = and i1 %.not110.2, %167, !dbg !115
  br i1 %168, label %load.2, label %oob, !dbg !115

load.2:                                           ; preds = %L87.2
  %169 = add i64 %122, %162, !dbg !116
  %.not114.2 = icmp ult i64 %169, %123, !dbg !116
  %170 = getelementptr inbounds double, double* %61, i64 %162, !dbg !116
  %171 = ptrtoint double* %170 to i64, !dbg !116
  %172 = sub i64 %171, %127, !dbg !116
  %173 = icmp ult i64 %172, %130, !dbg !116
  %174 = and i1 %.not114.2, %173, !dbg !116
  br i1 %174, label %load14.2, label %oob10, !dbg !116

load14.2:                                         ; preds = %load.2
  %175 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %56, i64 %162, !dbg !115
  %176 = bitcast {} addrspace(10)* addrspace(13)* %175 to double addrspace(13)*, !dbg !115
  %177 = load double, double addrspace(13)* %176, align 8, !dbg !115, !tbaa !149, !alias.scope !34, !noalias !151
  %178 = fmul double %177, %177, !dbg !152
  %179 = fmul double %177, %178, !dbg !152
  %180 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %67, i64 %162, !dbg !116
  %181 = bitcast {} addrspace(10)* addrspace(13)* %180 to double addrspace(13)*, !dbg !116
  store double %179, double addrspace(13)* %181, align 8, !dbg !116, !tbaa !149, !alias.scope !34, !noalias !35
  %.not119 = icmp eq i64 %value_phi4, 2, !dbg !162
  %182 = add nuw nsw i64 %value_phi4, 1
  br i1 %.not119, label %L159, label %L31, !dbg !148

oob22:                                            ; preds = %L186
  %183 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !128
  %184 = bitcast {} addrspace(10)* %183 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !128
  %.repack121 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %184, i64 0, i32 0, !dbg !128
  store i8* %57, i8* addrspace(10)* %.repack121, align 8, !dbg !128, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack122 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %184, i64 0, i32 1, !dbg !128
  store {} addrspace(10)* %58, {} addrspace(10)* addrspace(10)* %.repack122, align 8, !dbg !128, !tbaa !30, !alias.scope !34, !noalias !35
  %185 = addrspacecast {} addrspace(10)* %183 to {} addrspace(12)*, !dbg !128
  call void @ijl_bounds_error_int({} addrspace(12)* %185, i64 noundef 1) #20, !dbg !128
  unreachable, !dbg !128

load26:                                           ; preds = %L186
  %186 = load double, double addrspace(13)* %86, align 8, !dbg !128, !tbaa !149, !alias.scope !34, !noalias !151, !enzyme_type !163, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Float64 !12
  br label %L262, !dbg !145

oob28:                                            ; preds = %L207
  %187 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !133
  %188 = bitcast {} addrspace(10)* %187 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !133
  %.repack124 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %188, i64 0, i32 0, !dbg !133
  store i8* %57, i8* addrspace(10)* %.repack124, align 8, !dbg !133, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack125 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %188, i64 0, i32 1, !dbg !133
  store {} addrspace(10)* %58, {} addrspace(10)* addrspace(10)* %.repack125, align 8, !dbg !133, !tbaa !30, !alias.scope !34, !noalias !35
  %189 = addrspacecast {} addrspace(10)* %187 to {} addrspace(12)*, !dbg !133
  call void @ijl_bounds_error_int({} addrspace(12)* %189, i64 noundef 1) #20, !dbg !133
  unreachable, !dbg !133

load32:                                           ; preds = %L207
  %190 = load double, double addrspace(13)* %86, align 8, !dbg !133, !tbaa !149, !alias.scope !34, !noalias !151, !enzyme_type !163, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Float64 !12
  %191 = icmp ult i64 %122, 2, !dbg !135
  br i1 %191, label %L222, label %L225, !dbg !135

oob33:                                            ; preds = %L225
  %192 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !137
  %193 = bitcast {} addrspace(10)* %192 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !137
  %.repack128 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %193, i64 0, i32 0, !dbg !137
  store i8* %57, i8* addrspace(10)* %.repack128, align 8, !dbg !137, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack129 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %193, i64 0, i32 1, !dbg !137
  store {} addrspace(10)* %58, {} addrspace(10)* addrspace(10)* %.repack129, align 8, !dbg !137, !tbaa !30, !alias.scope !34, !noalias !35
  %194 = addrspacecast {} addrspace(10)* %192 to {} addrspace(12)*, !dbg !137
  call void @ijl_bounds_error_int({} addrspace(12)* %194, i64 noundef 2) #20, !dbg !137
  unreachable, !dbg !137

load37:                                           ; preds = %L225
  %195 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %67, i64 1, !dbg !137
  %196 = bitcast {} addrspace(10)* addrspace(13)* %195 to double addrspace(13)*, !dbg !137
  %197 = load double, double addrspace(13)* %196, align 8, !dbg !137, !tbaa !149, !alias.scope !34, !noalias !151, !enzyme_type !163, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Float64 !12
  %198 = fadd double %190, %197, !dbg !164
  %.not131178 = icmp sgt i64 %13, 2, !dbg !167
  br i1 %.not131178, label %L235, label %L262, !dbg !168

oob40:                                            ; preds = %L250
  %199 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !141
  %200 = bitcast {} addrspace(10)* %199 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !141
  %.repack134 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %200, i64 0, i32 0, !dbg !141
  store i8* %57, i8* addrspace(10)* %.repack134, align 8, !dbg !141, !tbaa !30, !alias.scope !34, !noalias !35
  %.repack135 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %200, i64 0, i32 1, !dbg !141
  store {} addrspace(10)* %58, {} addrspace(10)* addrspace(10)* %.repack135, align 8, !dbg !141, !tbaa !30, !alias.scope !34, !noalias !35
  %201 = addrspacecast {} addrspace(10)* %199 to {} addrspace(12)*, !dbg !141
  call void @ijl_bounds_error_int({} addrspace(12)* %201, i64 %102) #20, !dbg !141
  unreachable, !dbg !141

load44:                                           ; preds = %L250
  %202 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %67, i64 %value_phi39180, !dbg !141
  %203 = bitcast {} addrspace(10)* addrspace(13)* %202 to double addrspace(13)*, !dbg !141
  %204 = load double, double addrspace(13)* %203, align 8, !dbg !141, !tbaa !149, !alias.scope !34, !noalias !151
  %205 = fadd double %value_phi38179, %204, !dbg !169
  %exitcond285.not = icmp eq i64 %102, %13, !dbg !167
  br i1 %exitcond285.not, label %L262, label %L235, !dbg !168
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #11

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite)
declare noalias nonnull align 16 dereferenceable(16) {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)*, i64) local_unnamed_addr #12

; Function Attrs: noinline noreturn
define internal fastcc void @julia_throw_boundserror_22277([2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Integer, [-1,9]:Integer, [-1,10]:Integer, [-1,11]:Integer, [-1,12]:Integer, [-1,13]:Integer, [-1,14]:Integer, [-1,15]:Integer}" "enzymejl_parmtype"="127938118972368" "enzymejl_parmtype_ref"="1" %0, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1) unnamed_addr #13 !dbg !171 {
top:
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %2 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %3 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %4, align 8, !tbaa !17
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #17, !dbg !172
  fence syncscope("singlethread") seq_cst
  %5 = call noalias nonnull align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938118972368 to {}*) to {} addrspace(10)*)) #18, !dbg !172
  %6 = bitcast {} addrspace(10)* %5 to i8 addrspace(10)*, !dbg !172, !enzyme_inactive !12
  %7 = bitcast [2 x i64] addrspace(11)* %0 to i8 addrspace(11)*, !dbg !172, !enzyme_inactive !12
  call void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* nocapture nofree noundef nonnull align 8 dereferenceable(16) %6, i8 addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %7, i64 noundef 16, i1 noundef false), !dbg !172, !tbaa !40, !alias.scope !41, !noalias !42, !enzyme_truetype !43
  %8 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @ijl_box_int64(i64 signext %1) #22, !dbg !172
  %9 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938115566832 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %5, {} addrspace(10)* nonnull %8) #19, !dbg !172
  %10 = addrspacecast {} addrspace(10)* %9 to {} addrspace(12)*, !dbg !172
  call void @ijl_throw({} addrspace(12)* %10) #20, !dbg !172
  unreachable, !dbg !172
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite)
declare noalias nonnull align 8 dereferenceable(8) {} addrspace(10)* @ijl_box_int64(i64 signext) local_unnamed_addr #14

; Function Attrs: noinline
define internal fastcc "enzyme_type"="{[-1]:Float@double}" double @julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %2) unnamed_addr #15 !dbg !173 {
top:
  %3 = alloca [1 x i64], align 8
  %4 = alloca [2 x i64], align 8
  %5 = alloca [1 x i64], align 8
  %6 = alloca [1 x i64], align 8
  %7 = alloca [1 x i64], align 8
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task140 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %8 = bitcast {}*** %current_task140 to {}*
  %ptls_field41 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %9 = bitcast {}*** %ptls_field41 to i64***
  %ptls_load4243 = load i64**, i64*** %9, align 8, !tbaa !13
  %10 = getelementptr inbounds i64*, i64** %ptls_load4243, i64 2
  %safepoint = load i64*, i64** %10, align 8, !tbaa !17
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #17, !dbg !174
  fence syncscope("singlethread") seq_cst
  %.not = icmp eq i64 %2, %1, !dbg !175
  br i1 %.not, label %L5, label %L22, !dbg !177

L5:                                               ; preds = %top
  %11 = add i64 %2, -1, !dbg !178
  %12 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !181
  %13 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %12 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !181
  %14 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !181
  %15 = addrspacecast i8* addrspace(10)* %14 to i8* addrspace(11)*, !dbg !181
  %16 = load i8*, i8* addrspace(11)* %15, align 8, !dbg !181, !tbaa !80, !alias.scope !83, !noalias !103, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12, !enzyme_nocache !12
  %17 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %13, i64 0, i32 1, !dbg !181
  %18 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %17, align 8, !dbg !181, !tbaa !80, !alias.scope !83, !noalias !103, !dereferenceable_or_null !183, !align !184, !enzyme_type !72, !enzymejl_source_type_Memory\7BFloat64\7D !12, !enzymejl_byref_MUT_REF !12
  %19 = bitcast {} addrspace(10)* %18 to i64 addrspace(10)*, !dbg !178
  %20 = addrspacecast i64 addrspace(10)* %19 to i64 addrspace(11)*, !dbg !178
  %21 = load i64, i64 addrspace(11)* %20, align 8, !dbg !178, !tbaa !101, !alias.scope !83, !noalias !103, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %.not44 = icmp ult i64 %11, %21, !dbg !178
  br i1 %.not44, label %L17, label %L14, !dbg !178

L14:                                              ; preds = %L5
  %22 = getelementptr inbounds [1 x i64], [1 x i64]* %3, i64 0, i64 0, !dbg !178
  store i64 %2, i64* %22, align 8, !dbg !178, !tbaa !94, !alias.scope !96, !noalias !185
  %23 = addrspacecast [1 x i64]* %3 to [1 x i64] addrspace(11)*, !dbg !178
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %23) #20, !dbg !178
  unreachable, !dbg !178

L17:                                              ; preds = %L5
  %24 = shl nuw i64 %21, 1, !dbg !188
  %25 = add i64 %21, %11, !dbg !188
  %.not45 = icmp ult i64 %25, %24, !dbg !188
  %26 = bitcast i8* %16 to double*, !dbg !188
  %27 = getelementptr inbounds double, double* %26, i64 %11, !dbg !188
  %28 = bitcast {} addrspace(10)* %18 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !188
  %29 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %28 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !188
  %30 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %29, i64 0, i32 1, !dbg !188
  %31 = bitcast {} addrspace(10)** addrspace(11)* %30 to i8* addrspace(11)*, !dbg !188
  %32 = load i8*, i8* addrspace(11)* %31, align 8, !dbg !188, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12
  %33 = ptrtoint i8* %32 to i64, !dbg !188
  %34 = ptrtoint double* %27 to i64, !dbg !188
  %35 = sub i64 %34, %33, !dbg !188
  %36 = shl nuw nsw i64 %21, 3, !dbg !188
  %37 = icmp ult i64 %35, %36, !dbg !188
  %38 = and i1 %.not45, %37, !dbg !188
  br i1 %38, label %load, label %oob, !dbg !188

common.ret:                                       ; preds = %load21, %load13, %load, %L128
  %common.ret.op = phi double [ %103, %load ], [ %95, %L128 ], [ %119, %load13 ], [ %133, %load21 ]
  ret double %common.ret.op, !dbg !189

L22:                                              ; preds = %top
  %39 = sub i64 %2, %1, !dbg !190
  %.not48 = icmp slt i64 %39, 1024, !dbg !193
  br i1 %.not48, label %L27, label %L128, !dbg !192

L27:                                              ; preds = %L22
  %40 = add i64 %1, -1, !dbg !195
  %41 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !197
  %42 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %41 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !197
  %43 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !197
  %44 = addrspacecast i8* addrspace(10)* %43 to i8* addrspace(11)*, !dbg !197
  %45 = load i8*, i8* addrspace(11)* %44, align 8, !dbg !197, !tbaa !80, !alias.scope !83, !noalias !103, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12, !enzyme_nocache !12
  %46 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %42, i64 0, i32 1, !dbg !197
  %47 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %46, align 8, !dbg !197, !tbaa !80, !alias.scope !83, !noalias !103, !dereferenceable_or_null !183, !align !184, !enzyme_type !72, !enzymejl_source_type_Memory\7BFloat64\7D !12, !enzymejl_byref_MUT_REF !12
  %48 = bitcast {} addrspace(10)* %47 to i64 addrspace(10)*, !dbg !195
  %49 = addrspacecast i64 addrspace(10)* %48 to i64 addrspace(11)*, !dbg !195
  %50 = load i64, i64 addrspace(11)* %49, align 8, !dbg !195, !tbaa !101, !alias.scope !83, !noalias !103, !enzyme_inactive !12, !enzyme_type !28, !enzymejl_source_type_Int64 !12, !enzymejl_byref_BITS_VALUE !12
  %.not49 = icmp ult i64 %40, %50, !dbg !195
  br i1 %.not49, label %L39, label %L36, !dbg !195

L36:                                              ; preds = %L27
  %51 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0, !dbg !195
  store i64 %1, i64* %51, align 8, !dbg !195, !tbaa !94, !alias.scope !96, !noalias !185
  %52 = addrspacecast [1 x i64]* %7 to [1 x i64] addrspace(11)*, !dbg !195
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %52) #20, !dbg !195
  unreachable, !dbg !195

L39:                                              ; preds = %L27
  %53 = shl nuw i64 %50, 1, !dbg !198
  %54 = add i64 %50, %40, !dbg !198
  %.not50 = icmp ult i64 %54, %53, !dbg !198
  %55 = bitcast i8* %45 to double*, !dbg !198
  %56 = getelementptr inbounds double, double* %55, i64 %40, !dbg !198
  %57 = bitcast {} addrspace(10)* %47 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !198
  %58 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %57 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !198
  %59 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %58, i64 0, i32 1, !dbg !198
  %60 = bitcast {} addrspace(10)** addrspace(11)* %59 to i8* addrspace(11)*, !dbg !198
  %61 = load i8*, i8* addrspace(11)* %60, align 8, !dbg !198, !tbaa !17, !alias.scope !20, !noalias !23, !nonnull !12, !enzyme_type !79, !enzymejl_byref_BITS_VALUE !12, !enzymejl_source_type_Ptr\7BFloat64\7D !12
  %62 = ptrtoint i8* %61 to i64, !dbg !198
  %63 = ptrtoint double* %56 to i64, !dbg !198
  %64 = sub i64 %63, %62, !dbg !198
  %65 = shl nuw nsw i64 %50, 3, !dbg !198
  %66 = icmp ult i64 %64, %65, !dbg !198
  %67 = and i1 %.not50, %66, !dbg !198
  br i1 %67, label %load8, label %oob4, !dbg !198

L55:                                              ; preds = %load8
  %68 = getelementptr inbounds [1 x i64], [1 x i64]* %6, i64 0, i64 0, !dbg !199
  store i64 %112, i64* %68, align 8, !dbg !199, !tbaa !94, !alias.scope !96, !noalias !185
  %69 = addrspacecast [1 x i64]* %6 to [1 x i64] addrspace(11)*, !dbg !199
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %69) #20, !dbg !199
  unreachable, !dbg !199

L58:                                              ; preds = %load8
  %70 = add i64 %50, %1, !dbg !201
  %.not55 = icmp ult i64 %70, %53, !dbg !201
  %71 = getelementptr inbounds double, double* %55, i64 %1, !dbg !201
  %72 = ptrtoint double* %71 to i64, !dbg !201
  %73 = sub i64 %72, %62, !dbg !201
  %74 = icmp ult i64 %73, %65, !dbg !201
  %75 = and i1 %.not55, %74, !dbg !201
  br i1 %75, label %load13, label %oob9, !dbg !201

L83:                                              ; preds = %load21, %L83.lr.ph
  %value_phi1580 = phi i64 [ 0, %L83.lr.ph ], [ %76, %load21 ]
  %value_phi1479 = phi double [ %119, %L83.lr.ph ], [ %133, %load21 ]
  %76 = add nuw nsw i64 %value_phi1580, 1, !dbg !202
  %77 = add i64 %value_phi1580, %120, !dbg !210
  %.not61 = icmp sle i64 %77, %spec.select
  %78 = icmp sle i64 %120, %77
  %or.cond67 = and i1 %.not61, %78, !dbg !215
  br i1 %or.cond67, label %L106, label %L99, !dbg !215

L99:                                              ; preds = %L83
  %79 = addrspacecast [2 x i64]* %4 to [2 x i64] addrspace(11)*, !dbg !217
  call fastcc void @julia_throw_boundserror_22277([2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %79, i64 signext %76) #20, !dbg !217
  unreachable, !dbg !217

L106:                                             ; preds = %L83
  %80 = add i64 %77, -1, !dbg !218
  %exitcond.not = icmp eq i64 %value_phi1580, %126, !dbg !218
  br i1 %exitcond.not, label %L115, label %L118, !dbg !218

L115:                                             ; preds = %L106
  %81 = add i64 %50, 1, !dbg !222
  %82 = getelementptr inbounds [1 x i64], [1 x i64]* %5, i64 0, i64 0, !dbg !218
  store i64 %81, i64* %82, align 8, !dbg !218, !tbaa !94, !alias.scope !96, !noalias !185
  %83 = addrspacecast [1 x i64]* %5 to [1 x i64] addrspace(11)*, !dbg !218
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %83) #20, !dbg !218
  unreachable, !dbg !218

L118:                                             ; preds = %L106
  %84 = add i64 %80, %50, !dbg !223
  %.not63 = icmp ult i64 %84, %53, !dbg !223
  %85 = getelementptr inbounds double, double* %55, i64 %80, !dbg !223
  %86 = ptrtoint double* %85 to i64, !dbg !223
  %87 = sub i64 %86, %62, !dbg !223
  %88 = icmp ult i64 %87, %65, !dbg !223
  %89 = and i1 %.not63, %88, !dbg !223
  br i1 %89, label %load21, label %oob17, !dbg !223

L128:                                             ; preds = %L22
  %90 = ashr i64 %39, 1, !dbg !224
  %91 = add i64 %90, %1, !dbg !228
  %92 = call fastcc double @julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, i64 signext %1, i64 signext %91), !dbg !229
  %93 = add i64 %91, 1, !dbg !230
  %94 = call fastcc double @julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, i64 signext %93, i64 signext %2), !dbg !231
  %95 = fadd double %92, %94, !dbg !232
  br label %common.ret

oob:                                              ; preds = %L17
  %96 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %8, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !188
  %97 = bitcast {} addrspace(10)* %96 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !188
  %.repack = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %97, i64 0, i32 0, !dbg !188
  store i8* %16, i8* addrspace(10)* %.repack, align 8, !dbg !188, !tbaa !30, !alias.scope !34, !noalias !235
  %.repack46 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %97, i64 0, i32 1, !dbg !188
  store {} addrspace(10)* %18, {} addrspace(10)* addrspace(10)* %.repack46, align 8, !dbg !188, !tbaa !30, !alias.scope !34, !noalias !235
  %98 = addrspacecast {} addrspace(10)* %96 to {} addrspace(12)*, !dbg !188
  call void @ijl_bounds_error_int({} addrspace(12)* %98, i64 %2) #20, !dbg !188
  unreachable, !dbg !188

load:                                             ; preds = %L17
  %99 = bitcast i8* %16 to {} addrspace(10)**, !dbg !188
  %100 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %18, {} addrspace(10)** noundef %99), !dbg !188
  %101 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %11, !dbg !188
  %102 = bitcast {} addrspace(10)* addrspace(13)* %101 to double addrspace(13)*, !dbg !188
  %103 = load double, double addrspace(13)* %102, align 8, !dbg !188, !tbaa !149, !alias.scope !34, !noalias !151
  br label %common.ret

oob4:                                             ; preds = %L39
  %104 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %8, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !198
  %105 = bitcast {} addrspace(10)* %104 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !198
  %.repack51 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %105, i64 0, i32 0, !dbg !198
  store i8* %45, i8* addrspace(10)* %.repack51, align 8, !dbg !198, !tbaa !30, !alias.scope !34, !noalias !235
  %.repack52 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %105, i64 0, i32 1, !dbg !198
  store {} addrspace(10)* %47, {} addrspace(10)* addrspace(10)* %.repack52, align 8, !dbg !198, !tbaa !30, !alias.scope !34, !noalias !235
  %106 = addrspacecast {} addrspace(10)* %104 to {} addrspace(12)*, !dbg !198
  call void @ijl_bounds_error_int({} addrspace(12)* %106, i64 %1) #20, !dbg !198
  unreachable, !dbg !198

load8:                                            ; preds = %L39
  %107 = bitcast i8* %45 to {} addrspace(10)**, !dbg !198
  %108 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %47, {} addrspace(10)** noundef %107), !dbg !198
  %109 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %108, i64 %40, !dbg !198
  %110 = bitcast {} addrspace(10)* addrspace(13)* %109 to double addrspace(13)*, !dbg !198
  %111 = load double, double addrspace(13)* %110, align 8, !dbg !198, !tbaa !149, !alias.scope !34, !noalias !151
  %112 = add i64 %1, 1, !dbg !236
  %.not54 = icmp ugt i64 %50, %1, !dbg !199
  br i1 %.not54, label %L58, label %L55, !dbg !199

oob9:                                             ; preds = %L58
  %113 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %8, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !201
  %114 = bitcast {} addrspace(10)* %113 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !201
  %.repack56 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %114, i64 0, i32 0, !dbg !201
  store i8* %45, i8* addrspace(10)* %.repack56, align 8, !dbg !201, !tbaa !30, !alias.scope !34, !noalias !235
  %.repack57 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %114, i64 0, i32 1, !dbg !201
  store {} addrspace(10)* %47, {} addrspace(10)* addrspace(10)* %.repack57, align 8, !dbg !201, !tbaa !30, !alias.scope !34, !noalias !235
  %115 = addrspacecast {} addrspace(10)* %113 to {} addrspace(12)*, !dbg !201
  call void @ijl_bounds_error_int({} addrspace(12)* %115, i64 %112) #20, !dbg !201
  unreachable, !dbg !201

load13:                                           ; preds = %L58
  %116 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %108, i64 %1, !dbg !201
  %117 = bitcast {} addrspace(10)* addrspace(13)* %116 to double addrspace(13)*, !dbg !201
  %118 = load double, double addrspace(13)* %117, align 8, !dbg !201, !tbaa !149, !alias.scope !34, !noalias !151
  %119 = fadd double %111, %118, !dbg !237
  %120 = add i64 %1, 2, !dbg !239
  %.not59 = icmp sgt i64 %120, %2, !dbg !241
  %spec.select = select i1 %.not59, i64 %112, i64 %2, !dbg !245
  %121 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0, !dbg !247
  store i64 %120, i64* %121, align 8, !dbg !247, !tbaa !94, !alias.scope !96, !noalias !185
  %122 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1, !dbg !247
  store i64 %spec.select, i64* %122, align 8, !dbg !247, !tbaa !94, !alias.scope !96, !noalias !185
  %123 = sub i64 %spec.select, %120, !dbg !251
  %124 = icmp ugt i64 %123, 9223372036854775806, !dbg !257
  br i1 %124, label %common.ret, label %L83.lr.ph, !dbg !258

L83.lr.ph:                                        ; preds = %load13
  %125 = xor i64 %1, -1, !dbg !222
  %126 = add i64 %50, %125, !dbg !222
  br label %L83, !dbg !222

oob17:                                            ; preds = %L118
  %127 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %8, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #18, !dbg !223
  %128 = bitcast {} addrspace(10)* %127 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !223
  %.repack64 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %128, i64 0, i32 0, !dbg !223
  store i8* %45, i8* addrspace(10)* %.repack64, align 8, !dbg !223, !tbaa !30, !alias.scope !34, !noalias !235
  %.repack65 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %128, i64 0, i32 1, !dbg !223
  store {} addrspace(10)* %47, {} addrspace(10)* addrspace(10)* %.repack65, align 8, !dbg !223, !tbaa !30, !alias.scope !34, !noalias !235
  %129 = addrspacecast {} addrspace(10)* %127 to {} addrspace(12)*, !dbg !223
  call void @ijl_bounds_error_int({} addrspace(12)* %129, i64 %77) #20, !dbg !223
  unreachable, !dbg !223

load21:                                           ; preds = %L118
  %130 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %108, i64 %80, !dbg !223
  %131 = bitcast {} addrspace(10)* addrspace(13)* %130 to double addrspace(13)*, !dbg !223
  %132 = load double, double addrspace(13)* %131, align 8, !dbg !223, !tbaa !149, !alias.scope !34, !noalias !151
  %133 = fadd reassoc contract double %value_phi1479, %132, !dbg !259
  %exitcond89.not = icmp eq i64 %value_phi1580, %123, !dbg !261
  br i1 %exitcond89.not, label %common.ret, label %L83, !dbg !222, !llvm.loop !262
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #16

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #16

attributes #0 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127936831422544" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #1 = { nofree memory(none) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzyme_shouldrecompute" "enzymejl_world"="26750" }
attributes #2 = { nofree memory(argmem: readwrite, inaccessiblemem: readwrite) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #3 = { nofree "enzymejl_world"="26750" }
attributes #4 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #5 = { noreturn "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #6 = { noreturn "enzymejl_world"="26750" }
attributes #7 = { norecurse nosync nounwind speculatable willreturn memory(none) "enzyme_nocache" "enzyme_shouldrecompute" "enzymejl_world"="26750" }
attributes #8 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127936785911312" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) "enzymejl_world"="26750" }
attributes #10 = { "enzyme_ta_norecur" "enzymejl_mi"="127938237546640" "enzymejl_rt"="127938131215840" "enzymejl_world"="26750" }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "enzymejl_world"="26750" }
attributes #12 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #13 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127938081173200" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #14 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #15 = { noinline "enzyme_parmremove"="3" "enzyme_ta_norecur" "enzymejl_mi"="127938240516112" "enzymejl_rt"="127938131215840" "enzymejl_world"="26750" }
attributes #16 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #17 = { memory(readwrite) }
attributes #18 = { nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #19 = { nofree }
attributes #20 = { noreturn }
attributes #21 = { nounwind memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #22 = { nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2, !4, !5, !6, !7, !8}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!3 = !DIFile(filename: "julia", directory: ".")
!4 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!5 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!6 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!7 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!8 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!9 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22281", scope: null, file: !10, line: 14, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !12)
!10 = !DIFile(filename: "essentials.jl", directory: ".")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !{!14, !14, i64 0}
!14 = !{!"jtbaa_gcframe", !15, i64 0}
!15 = !{!"jtbaa", !16, i64 0}
!16 = !{!"jtbaa"}
!17 = !{!18, !18, i64 0, i64 0}
!18 = !{!"jtbaa_const", !15, i64 0}
!19 = !DILocation(line: 14, scope: !9)
!20 = !{!21}
!21 = !{!"jnoalias_const", !22}
!22 = !{!"jnoalias"}
!23 = !{!24, !25, !26, !27}
!24 = !{!"jnoalias_gcframe", !22}
!25 = !{!"jnoalias_stack", !22}
!26 = !{!"jnoalias_data", !22}
!27 = !{!"jnoalias_typemd", !22}
!28 = !{!"Unknown", i32 -1, !29}
!29 = !{!"Integer"}
!30 = !{!31, !31, i64 0}
!31 = !{!"jtbaa_immut", !32, i64 0}
!32 = !{!"jtbaa_value", !33, i64 0}
!33 = !{!"jtbaa_data", !15, i64 0}
!34 = !{!26}
!35 = !{!36, !24, !25, !27, !21}
!36 = distinct !{!36, !37, !"na_addr13"}
!37 = distinct !{!37, !"addr13"}
!38 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22262", scope: null, file: !10, line: 14, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !12)
!39 = !DILocation(line: 14, scope: !38)
!40 = !{!15, !15, i64 0}
!41 = !{!21, !26}
!42 = !{!36, !24, !25, !27}
!43 = !{!"Integer", i64 0, !"Integer", i64 8}
!44 = distinct !DISubprogram(name: "f_cartesian", linkageName: "julia_f_cartesian_22225", scope: null, file: !45, line: 35, type: !11, scopeLine: 35, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!45 = !DIFile(filename: "/home/guillaume/Work/GitHub/Julia/EnzymeErrorReproducer.jl/src/EnzymeErrorReproducer.jl", directory: ".")
!46 = !DILocation(line: 35, scope: !44)
!47 = !DILocation(line: 191, scope: !48, inlinedAt: !50)
!48 = distinct !DISubprogram(name: "size;", linkageName: "size", scope: !49, file: !49, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!49 = !DIFile(filename: "array.jl", directory: ".")
!50 = !DILocation(line: 368, scope: !51, inlinedAt: !52)
!51 = distinct !DISubprogram(name: "similar;", linkageName: "similar", scope: !49, file: !49, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!52 = !DILocation(line: 14, scope: !53, inlinedAt: !54)
!53 = distinct !DISubprogram(name: "arraycube_cartesian;", linkageName: "arraycube_cartesian", scope: !45, file: !45, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!54 = !DILocation(line: 36, scope: !44)
!55 = !{!27, !25}
!56 = !{!36, !24, !26, !21}
!57 = !DILocation(line: 541, scope: !58, inlinedAt: !60)
!58 = distinct !DISubprogram(name: "_checked_mul_dims;", linkageName: "_checked_mul_dims", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!59 = !DIFile(filename: "boot.jl", directory: ".")
!60 = !DILocation(line: 571, scope: !61, inlinedAt: !62)
!61 = distinct !DISubprogram(name: "checked_dims;", linkageName: "checked_dims", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!62 = !DILocation(line: 582, scope: !63, inlinedAt: !50)
!63 = distinct !DISubprogram(name: "Array;", linkageName: "Array", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!64 = !DILocation(line: 544, scope: !58, inlinedAt: !60)
!65 = !DILocation(line: 545, scope: !58, inlinedAt: !60)
!66 = !DILocation(line: 572, scope: !61, inlinedAt: !62)
!67 = !DILocation(line: 512, scope: !68, inlinedAt: !69)
!68 = distinct !DISubprogram(name: "GenericMemory;", linkageName: "GenericMemory", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!69 = !DILocation(line: 535, scope: !70, inlinedAt: !62)
!70 = distinct !DISubprogram(name: "new_as_memoryref;", linkageName: "new_as_memoryref", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!71 = !DILocation(line: 514, scope: !68, inlinedAt: !69)
!72 = !{!"Unknown", i32 -1, !73}
!73 = !{!"Pointer", i32 0, !29, i32 1, !29, i32 2, !29, i32 3, !29, i32 4, !29, i32 5, !29, i32 6, !29, i32 7, !29, i32 8, !74}
!74 = !{!"Pointer", i32 -1, !75}
!75 = !{!"Float@double"}
!76 = !DILocation(line: 516, scope: !68, inlinedAt: !69)
!77 = !DILocation(line: 522, scope: !78, inlinedAt: !69)
!78 = distinct !DISubprogram(name: "memoryref;", linkageName: "memoryref", scope: !59, file: !59, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!79 = !{!"Unknown", i32 -1, !74}
!80 = !{!81, !81, i64 0}
!81 = !{!"jtbaa_arrayptr", !82, i64 0}
!82 = !{!"jtbaa_array", !15, i64 0}
!83 = !{!27}
!84 = !{!36, !24, !25, !26, !21}
!85 = !{!25, !27}
!86 = !DILocation(line: 0, scope: !44)
!87 = !DILocation(line: 699, scope: !88, inlinedAt: !90)
!88 = distinct !DISubprogram(name: "checkbounds;", linkageName: "checkbounds", scope: !89, file: !89, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!89 = !DIFile(filename: "abstractarray.jl", directory: ".")
!90 = !DILocation(line: 929, scope: !91, inlinedAt: !92)
!91 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !49, file: !49, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!92 = !DILocation(line: 17, scope: !53, inlinedAt: !54)
!93 = !DILocation(line: 697, scope: !88, inlinedAt: !90)
!94 = !{!95, !95, i64 0}
!95 = !{!"jtbaa_stack", !15, i64 0}
!96 = !{!25}
!97 = !{!36, !24, !26, !27, !21}
!98 = !DILocation(line: 916, scope: !99, inlinedAt: !100)
!99 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !10, file: !10, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!100 = !DILocation(line: 930, scope: !91, inlinedAt: !92)
!101 = !{!102, !102, i64 0, i64 0}
!102 = !{!"jtbaa_memorylen", !82, i64 0}
!103 = !{!24, !25, !26, !21}
!104 = !DILocation(line: 87, scope: !105, inlinedAt: !107)
!105 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!106 = !DIFile(filename: "int.jl", directory: ".")
!107 = !DILocation(line: 3080, scope: !108, inlinedAt: !109)
!108 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !89, file: !89, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!109 = !DILocation(line: 3080, scope: !108, inlinedAt: !110)
!110 = !DILocation(line: 3064, scope: !111, inlinedAt: !112)
!111 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !89, file: !89, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!112 = !DILocation(line: 3048, scope: !111, inlinedAt: !113)
!113 = !DILocation(line: 1347, scope: !114, inlinedAt: !100)
!114 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !89, file: !89, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!115 = !DILocation(line: 917, scope: !99, inlinedAt: !100)
!116 = !DILocation(line: 994, scope: !117, inlinedAt: !92)
!117 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !49, file: !49, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!118 = !DILocation(line: 428, scope: !119, inlinedAt: !121)
!119 = distinct !DISubprogram(name: "_mapreduce;", linkageName: "_mapreduce", scope: !120, file: !120, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!120 = !DIFile(filename: "reduce.jl", directory: ".")
!121 = !DILocation(line: 32, scope: !122, inlinedAt: !123)
!122 = distinct !DISubprogram(name: "mysum;", linkageName: "mysum", scope: !45, file: !45, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!123 = !DILocation(line: 37, scope: !44)
!124 = !DILocation(line: 639, scope: !125, inlinedAt: !127)
!125 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !126, file: !126, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!126 = !DIFile(filename: "promotion.jl", directory: ".")
!127 = !DILocation(line: 430, scope: !119, inlinedAt: !121)
!128 = !DILocation(line: 917, scope: !99, inlinedAt: !129)
!129 = !DILocation(line: 431, scope: !119, inlinedAt: !121)
!130 = !DILocation(line: 83, scope: !131, inlinedAt: !132)
!131 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!132 = !DILocation(line: 433, scope: !119, inlinedAt: !121)
!133 = !DILocation(line: 917, scope: !99, inlinedAt: !134)
!134 = !DILocation(line: 435, scope: !119, inlinedAt: !121)
!135 = !DILocation(line: 916, scope: !99, inlinedAt: !136)
!136 = !DILocation(line: 436, scope: !119, inlinedAt: !121)
!137 = !DILocation(line: 917, scope: !99, inlinedAt: !136)
!138 = !DILocation(line: 87, scope: !105, inlinedAt: !139)
!139 = !DILocation(line: 439, scope: !119, inlinedAt: !121)
!140 = !DILocation(line: 916, scope: !99, inlinedAt: !139)
!141 = !DILocation(line: 917, scope: !99, inlinedAt: !139)
!142 = !DILocation(line: 277, scope: !143, inlinedAt: !144)
!143 = distinct !DISubprogram(name: "mapreduce_impl;", linkageName: "mapreduce_impl", scope: !120, file: !120, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!144 = !DILocation(line: 444, scope: !119, inlinedAt: !121)
!145 = !DILocation(line: 908, scope: !146, inlinedAt: !148)
!146 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!147 = !DIFile(filename: "range.jl", directory: ".")
!148 = !DILocation(line: 19, scope: !53, inlinedAt: !54)
!149 = !{!150, !150, i64 0}
!150 = !{!"jtbaa_arraybuf", !33, i64 0}
!151 = !{!24, !25, !27, !21}
!152 = !DILocation(line: 493, scope: !153, inlinedAt: !155)
!153 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !154, file: !154, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!154 = !DIFile(filename: "float.jl", directory: ".")
!155 = !DILocation(line: 596, scope: !156, inlinedAt: !158)
!156 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !157, file: !157, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!157 = !DIFile(filename: "operators.jl", directory: ".")
!158 = !DILocation(line: 371, scope: !159, inlinedAt: !92)
!159 = distinct !DISubprogram(name: "literal_pow;", linkageName: "literal_pow", scope: !160, file: !160, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!160 = !DIFile(filename: "intfuncs.jl", directory: ".")
!161 = !{i64 0, i64 1152921504606846975}
!162 = !DILocation(line: 639, scope: !125, inlinedAt: !145)
!163 = !{!"Unknown", i32 -1, !75}
!164 = !DILocation(line: 491, scope: !165, inlinedAt: !166)
!165 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !154, file: !154, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !12)
!166 = !DILocation(line: 437, scope: !119, inlinedAt: !121)
!167 = !DILocation(line: 83, scope: !131, inlinedAt: !168)
!168 = !DILocation(line: 438, scope: !119, inlinedAt: !121)
!169 = !DILocation(line: 491, scope: !165, inlinedAt: !170)
!170 = !DILocation(line: 440, scope: !119, inlinedAt: !121)
!171 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22277", scope: null, file: !10, line: 14, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !12)
!172 = !DILocation(line: 14, scope: !171)
!173 = distinct !DISubprogram(name: "mapreduce_impl", linkageName: "julia_mapreduce_impl_22268", scope: null, file: !120, line: 253, type: !11, scopeLine: 253, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!174 = !DILocation(line: 253, scope: !173)
!175 = !DILocation(line: 639, scope: !176, inlinedAt: !177)
!176 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !126, file: !126, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!177 = !DILocation(line: 255, scope: !173)
!178 = !DILocation(line: 916, scope: !179, inlinedAt: !180)
!179 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !10, file: !10, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!180 = !DILocation(line: 256, scope: !173)
!181 = !DILocation(line: 12, scope: !182, inlinedAt: !178)
!182 = distinct !DISubprogram(name: "length;", linkageName: "length", scope: !10, file: !10, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!183 = !{i64 16}
!184 = !{i64 8}
!185 = !{!186, !24, !26, !27, !21}
!186 = distinct !{!186, !187, !"na_addr13"}
!187 = distinct !{!187, !"addr13"}
!188 = !DILocation(line: 917, scope: !179, inlinedAt: !180)
!189 = !DILocation(line: 0, scope: !173)
!190 = !DILocation(line: 86, scope: !191, inlinedAt: !192)
!191 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!192 = !DILocation(line: 258, scope: !173)
!193 = !DILocation(line: 83, scope: !194, inlinedAt: !192)
!194 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!195 = !DILocation(line: 916, scope: !179, inlinedAt: !196)
!196 = !DILocation(line: 260, scope: !173)
!197 = !DILocation(line: 12, scope: !182, inlinedAt: !195)
!198 = !DILocation(line: 917, scope: !179, inlinedAt: !196)
!199 = !DILocation(line: 916, scope: !179, inlinedAt: !200)
!200 = !DILocation(line: 261, scope: !173)
!201 = !DILocation(line: 917, scope: !179, inlinedAt: !200)
!202 = !DILocation(line: 87, scope: !203, inlinedAt: !204)
!203 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!204 = !DILocation(line: 54, scope: !205, inlinedAt: !207)
!205 = distinct !DISubprogram(name: "simd_index;", linkageName: "simd_index", scope: !206, file: !206, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!206 = !DIFile(filename: "simdloop.jl", directory: ".")
!207 = !DILocation(line: 76, scope: !208, inlinedAt: !209)
!208 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !206, file: !206, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!209 = !DILocation(line: 263, scope: !173)
!210 = !DILocation(line: 87, scope: !203, inlinedAt: !211)
!211 = !DILocation(line: 938, scope: !212, inlinedAt: !213)
!212 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!213 = !DILocation(line: 3076, scope: !214, inlinedAt: !204)
!214 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !49, file: !49, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!215 = !DILocation(line: 926, scope: !216, inlinedAt: !217)
!216 = distinct !DISubprogram(name: "_in_unit_range;", linkageName: "_in_unit_range", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!217 = !DILocation(line: 939, scope: !212, inlinedAt: !213)
!218 = !DILocation(line: 916, scope: !179, inlinedAt: !219)
!219 = !DILocation(line: 264, scope: !220, inlinedAt: !221)
!220 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !120, file: !120, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!221 = !DILocation(line: 77, scope: !208, inlinedAt: !209)
!222 = !DILocation(line: 75, scope: !208, inlinedAt: !209)
!223 = !DILocation(line: 917, scope: !179, inlinedAt: !219)
!224 = !DILocation(line: 527, scope: !225, inlinedAt: !226)
!225 = distinct !DISubprogram(name: ">>;", linkageName: ">>", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!226 = !DILocation(line: 534, scope: !225, inlinedAt: !227)
!227 = !DILocation(line: 270, scope: !173)
!228 = !DILocation(line: 87, scope: !203, inlinedAt: !227)
!229 = !DILocation(line: 271, scope: !173)
!230 = !DILocation(line: 87, scope: !203, inlinedAt: !231)
!231 = !DILocation(line: 272, scope: !173)
!232 = !DILocation(line: 491, scope: !233, inlinedAt: !234)
!233 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !154, file: !154, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!234 = !DILocation(line: 273, scope: !173)
!235 = !{!186, !24, !25, !27, !21}
!236 = !DILocation(line: 87, scope: !203, inlinedAt: !200)
!237 = !DILocation(line: 491, scope: !233, inlinedAt: !238)
!238 = !DILocation(line: 262, scope: !173)
!239 = !DILocation(line: 87, scope: !203, inlinedAt: !240)
!240 = !DILocation(line: 69, scope: !208, inlinedAt: !209)
!241 = !DILocation(line: 514, scope: !242, inlinedAt: !243)
!242 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !106, file: !106, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!243 = !DILocation(line: 426, scope: !244, inlinedAt: !245)
!244 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !157, file: !157, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!245 = !DILocation(line: 419, scope: !246, inlinedAt: !247)
!246 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!247 = !DILocation(line: 408, scope: !248, inlinedAt: !249)
!248 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!249 = !DILocation(line: 5, scope: !250, inlinedAt: !240)
!250 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!251 = !DILocation(line: 86, scope: !191, inlinedAt: !252)
!252 = !DILocation(line: 768, scope: !253, inlinedAt: !254)
!253 = distinct !DISubprogram(name: "length;", linkageName: "length", scope: !147, file: !147, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!254 = !DILocation(line: 51, scope: !255, inlinedAt: !256)
!255 = distinct !DISubprogram(name: "simd_inner_length;", linkageName: "simd_inner_length", scope: !206, file: !206, type: !11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4, retainedNodes: !12)
!256 = !DILocation(line: 71, scope: !208, inlinedAt: !209)
!257 = !DILocation(line: 83, scope: !194, inlinedAt: !258)
!258 = !DILocation(line: 72, scope: !208, inlinedAt: !209)
!259 = !DILocation(line: 491, scope: !233, inlinedAt: !260)
!260 = !DILocation(line: 265, scope: !220, inlinedAt: !221)
!261 = !DILocation(line: 83, scope: !194, inlinedAt: !222)
!262 = distinct !{!262}
""";

llvm_module2 = """
; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128-ni:10:11:12:13"
target triple = "x86_64-linux-gnu"

@jl_undefref_exception = external local_unnamed_addr constant {}*
@ejl_jl_nothing = external addrspace(10) global {}, !enzyme_inactive !0, !enzyme_ta_norecur !0

; Function Attrs: noinline noreturn
define internal fastcc void @julia_throw_boundserror_20945({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %1) unnamed_addr #0 !dbg !13 {
top:
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %2 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %3 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %3, align 8, !tbaa !16
  %4 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %4, align 8, !tbaa !20
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #25, !dbg !22
  fence syncscope("singlethread") seq_cst
  %5 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938075238032 to {}*) to {} addrspace(10)*)) #26, !dbg !22
  %6 = getelementptr inbounds [1 x i64], [1 x i64] addrspace(11)* %1, i64 0, i64 0, !dbg !22
  %7 = bitcast {} addrspace(10)* %5 to i64 addrspace(10)*, !dbg !22, !enzyme_inactive !0
  %8 = load i64, i64 addrspace(11)* %6, align 8, !dbg !22, !tbaa !20, !alias.scope !23, !noalias !26
  store i64 %8, i64 addrspace(10)* %7, align 8, !dbg !22, !tbaa !31, !alias.scope !35, !noalias !36
  %9 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938098682144 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %0, {} addrspace(10)* nofree nonnull %5) #27, !dbg !22
  %10 = addrspacecast {} addrspace(10)* %9 to {} addrspace(12)*, !dbg !22
  call void @ijl_throw({} addrspace(12)* %10) #28, !dbg !22
  unreachable, !dbg !22
}

; Function Attrs: nofree memory(none)
declare {}*** @julia.get_pgcstack() local_unnamed_addr #1

; Function Attrs: nofree memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @julia.safepoint(i64*) local_unnamed_addr #2

; Function Attrs: nofree
declare nonnull {} addrspace(10)* @ijl_invoke({} addrspace(10)*, {} addrspace(10)** nocapture readonly, i32, {} addrspace(10)*) #3

; Function Attrs: nofree
declare nonnull {} addrspace(10)* @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite)
declare noalias nonnull {} addrspace(10)* @julia.gc_alloc_obj({}*, i64, {} addrspace(10)*) local_unnamed_addr #4

; Function Attrs: noreturn
declare void @ijl_throw({} addrspace(12)*) local_unnamed_addr #5

define nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" {} addrspace(10)* @julia_mygradient_20915({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0) local_unnamed_addr #6 !dbg !39 {
top:
  %1 = alloca [1 x i64], align 8
  %pgcstack = call {}*** @julia.get_pgcstack()
  %current_task129 = getelementptr inbounds {}**, {}*** %pgcstack, i64 -14
  %2 = bitcast {}*** %current_task129 to {}*
  %ptls_field30 = getelementptr inbounds {}**, {}*** %pgcstack, i64 2
  %3 = bitcast {}*** %ptls_field30 to i64***
  %ptls_load3132 = load i64**, i64*** %3, align 8, !tbaa !16
  %4 = getelementptr inbounds i64*, i64** %ptls_load3132, i64 2
  %safepoint = load i64*, i64** %4, align 8, !tbaa !20
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint), !dbg !41
  fence syncscope("singlethread") seq_cst
  %5 = bitcast {} addrspace(10)* %0 to i8 addrspace(10)*, !dbg !42
  %6 = addrspacecast i8 addrspace(10)* %5 to i8 addrspace(11)*, !dbg !42
  %7 = getelementptr inbounds i8, i8 addrspace(11)* %6, i64 16, !dbg !42
  %.sroa.023.0..sroa_idx = bitcast i8 addrspace(11)* %7 to i64 addrspace(11)*, !dbg !42
  %.sroa.023.0.copyload = load i64, i64 addrspace(11)* %.sroa.023.0..sroa_idx, align 8, !dbg !42, !tbaa !51, !alias.scope !52, !noalias !53, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.sroa.4.0..sroa_idx26 = getelementptr inbounds i8, i8 addrspace(11)* %6, i64 24, !dbg !42
  %8 = bitcast i8 addrspace(11)* %.sroa.4.0..sroa_idx26 to i64 addrspace(11)*, !dbg !42
  %.sroa.1.0.copyload = load i64, i64 addrspace(11)* %8, align 8, !dbg !42, !tbaa !51, !alias.scope !52, !noalias !53, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.sroa.023.0.copyload, i64 %.sroa.1.0.copyload), !dbg !56
  %10 = extractvalue { i64, i1 } %9, 0, !dbg !56
  %11 = extractvalue { i64, i1 } %9, 1, !dbg !56
  %12 = icmp ugt i64 %.sroa.023.0.copyload, 9223372036854775806, !dbg !63
  %13 = or i1 %12, %11, !dbg !63
  %14 = icmp ugt i64 %.sroa.1.0.copyload, 9223372036854775806, !dbg !64
  %15 = or i1 %14, %13, !dbg !64
  br i1 %15, label %L13, label %L17, !dbg !65

L13:                                              ; preds = %top
  %16 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657840 to {}*) to {} addrspace(10)*)) #26, !dbg !65
  %17 = bitcast {} addrspace(10)* %16 to [1 x {} addrspace(10)*] addrspace(10)*, !dbg !65, !enzyme_inactive !0
  %18 = getelementptr [1 x {} addrspace(10)*], [1 x {} addrspace(10)*] addrspace(10)* %17, i64 0, i64 0, !dbg !65
  store {} addrspace(10)* addrspacecast ({}* inttoptr (i64 127938155009344 to {}*) to {} addrspace(10)*), {} addrspace(10)* addrspace(10)* %18, align 8, !dbg !65, !tbaa !31, !alias.scope !35, !noalias !36
  %19 = addrspacecast {} addrspace(10)* %16 to {} addrspace(12)*, !dbg !65, !enzyme_inactive !0
  call void @ijl_throw({} addrspace(12)* %19) #28, !dbg !65
  unreachable, !dbg !65

L17:                                              ; preds = %top
  %.not = icmp eq i64 %10, 0, !dbg !66
  br i1 %.not, label %L19, label %L21, !dbg !66

L19:                                              ; preds = %L17
  %20 = load atomic {} addrspace(10)*, {} addrspace(10)** inttoptr (i64 127938077110288 to {} addrspace(10)**) unordered, align 16, !dbg !70, !tbaa !20, !alias.scope !23, !noalias !26, !nonnull !0, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_BITS_REF !0
  %.not33 = icmp eq {} addrspace(10)* %20, null, !dbg !70
  br i1 %.not33, label %fail, label %L23, !dbg !70

L21:                                              ; preds = %L17
  %21 = call noalias "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Pointer, [-1,8,-1]:Float@double}" {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077110256 to {}*) to {} addrspace(10)*), i64 %10) #29, !dbg !75
  br label %L23, !dbg !75

L23:                                              ; preds = %L19, %L21
  %value_phi = phi {} addrspace(10)* [ %21, %L21 ], [ %20, %L19 ]
  %22 = bitcast {} addrspace(10)* %value_phi to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !76
  %23 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %22 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !76
  %24 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %23, i64 0, i32 1, !dbg !76
  %25 = bitcast {} addrspace(10)** addrspace(11)* %24 to i8* addrspace(11)*, !dbg !76
  %26 = load i8*, i8* addrspace(11)* %25, align 8, !dbg !76, !tbaa !51, !alias.scope !78, !noalias !79, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %27 = call noalias nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 32, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938216542032 to {}*) to {} addrspace(10)*)) #26, !dbg !61
  %28 = bitcast {} addrspace(10)* %27 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !61
  %29 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %28 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !61
  %.repack = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %29, i64 0, i32 0, !dbg !61
  store i8* %26, i8* addrspace(11)* %.repack, align 8, !dbg !61, !tbaa !81, !alias.scope !84, !noalias !85
  %.repack34 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %29, i64 0, i32 1, !dbg !61
  store {} addrspace(10)* %value_phi, {} addrspace(10)* addrspace(11)* %.repack34, align 8, !dbg !61, !tbaa !81, !alias.scope !84, !noalias !85
  %30 = bitcast {} addrspace(10)* %27 to i8 addrspace(10)*, !dbg !61
  %31 = addrspacecast i8 addrspace(10)* %30 to i8 addrspace(11)*, !dbg !61
  %32 = getelementptr inbounds i8, i8 addrspace(11)* %31, i64 16, !dbg !61
  %.sroa.0.0..sroa_idx = bitcast i8 addrspace(11)* %32 to i64 addrspace(11)*, !dbg !61
  store i64 %.sroa.023.0.copyload, i64 addrspace(11)* %.sroa.0.0..sroa_idx, align 8, !dbg !61, !tbaa !51, !alias.scope !86, !noalias !53
  %.sroa.2.0..sroa_idx16 = getelementptr inbounds i8, i8 addrspace(11)* %31, i64 24, !dbg !61
  %33 = bitcast i8 addrspace(11)* %.sroa.2.0..sroa_idx16 to i64 addrspace(11)*, !dbg !61
  store i64 %.sroa.1.0.copyload, i64 addrspace(11)* %33, align 8, !dbg !61, !tbaa !51, !alias.scope !86, !noalias !53
  %34 = bitcast {} addrspace(10)* %value_phi to i64 addrspace(10)*, !dbg !87
  %35 = addrspacecast i64 addrspace(10)* %34 to i64 addrspace(11)*, !dbg !87
  %36 = load i64, i64 addrspace(11)* %35, align 8, !dbg !87, !tbaa !104, !alias.scope !84, !noalias !106, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %37 = call i64 @llvm.smax.i64(i64 %36, i64 noundef 0), !dbg !107
  %38 = icmp slt i64 %36, 1, !dbg !109
  br i1 %38, label %L77, label %L44.preheader, !dbg !102

L44.preheader:                                    ; preds = %L23
  %39 = shl nuw i64 %36, 1
  %40 = bitcast i8* %26 to {} addrspace(10)**
  %41 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %value_phi, {} addrspace(10)** noundef %40), !dbg !117
  %42 = add nuw i64 %36, 1, !dbg !118
  br label %L44, !dbg !118

L44:                                              ; preds = %L44.preheader, %load
  %value_phi7 = phi i64 [ %56, %load ], [ 1, %L44.preheader ]
  %43 = add nsw i64 %value_phi7, -1, !dbg !121
  %exitcond.not = icmp eq i64 %value_phi7, %42, !dbg !123
  br i1 %exitcond.not, label %L57, label %L60, !dbg !118

L57:                                              ; preds = %L44
  %44 = getelementptr inbounds [1 x i64], [1 x i64]* %1, i64 0, i64 0, !dbg !118
  store i64 %42, i64* %44, align 8, !dbg !118, !tbaa !124, !alias.scope !126, !noalias !127
  %45 = addrspacecast [1 x i64]* %1 to [1 x i64] addrspace(11)*, !dbg !118
  call fastcc void @julia_throw_boundserror_20945({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %27, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %45) #28, !dbg !118
  unreachable, !dbg !118

L60:                                              ; preds = %L44
  %46 = add nuw i64 %43, %36, !dbg !128
  %.not37 = icmp ult i64 %46, %39, !dbg !128
  %47 = icmp ult i64 %43, %36, !dbg !128
  %48 = and i1 %47, %.not37, !dbg !128
  br i1 %48, label %load, label %oob, !dbg !128

L77:                                              ; preds = %load, %L23
  call void @diffejulia_f_cartesian_22225wrap({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %27, double noundef 1.000000e+00), !dbg !129
  ret {} addrspace(10)* %27, !dbg !142

fail:                                             ; preds = %L19
  %49 = load {}*, {}** @jl_undefref_exception, align 8, !dbg !70, !tbaa !20, !alias.scope !23, !noalias !26, !nonnull !0
  %50 = addrspacecast {}* %49 to {} addrspace(12)*, !dbg !70
  call void @ijl_throw({} addrspace(12)* %50) #28, !dbg !70
  unreachable, !dbg !70

oob:                                              ; preds = %L60
  %51 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %2, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #26, !dbg !128
  %52 = bitcast {} addrspace(10)* %51 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !128
  %.repack38 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %52, i64 0, i32 0, !dbg !128
  store i8* %26, i8* addrspace(10)* %.repack38, align 8, !dbg !128, !tbaa !31, !alias.scope !35, !noalias !36
  %.repack39 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %52, i64 0, i32 1, !dbg !128
  store {} addrspace(10)* %value_phi, {} addrspace(10)* addrspace(10)* %.repack39, align 8, !dbg !128, !tbaa !31, !alias.scope !35, !noalias !36
  %53 = addrspacecast {} addrspace(10)* %51 to {} addrspace(12)*, !dbg !128
  call void @ijl_bounds_error_int({} addrspace(12)* %53, i64 %value_phi7) #28, !dbg !128
  unreachable, !dbg !128

load:                                             ; preds = %L60
  %54 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %41, i64 %43, !dbg !128
  %55 = bitcast {} addrspace(10)* addrspace(13)* %54 to double addrspace(13)*, !dbg !128
  store double 0.000000e+00, double addrspace(13)* %55, align 8, !dbg !128, !tbaa !143, !alias.scope !35, !noalias !36
  %.not41 = icmp eq i64 %value_phi7, %37, !dbg !145
  %56 = add nuw i64 %value_phi7, 1
  br i1 %.not41, label %L77, label %L44, !dbg !148
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #7

; Function Attrs: noreturn
declare void @ijl_bounds_error_int({} addrspace(12)*, i64) local_unnamed_addr #8

; Function Attrs: norecurse nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* nocapture noundef nonnull readnone, {} addrspace(10)** noundef nonnull readnone) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite)
declare noalias nonnull align 16 dereferenceable(16) {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)*, i64) local_unnamed_addr #10

; Function Attrs: alwaysinline
define void @diffejulia_f_cartesian_22225wrap({} addrspace(10)* %0, {} addrspace(10)* nocapture readonly %1, double %2) local_unnamed_addr #11 !dbg !149 {
entry:
  %3 = call {}*** @julia.get_pgcstack()
  %4 = alloca [2 x {} addrspace(10)*], align 16
  %5 = bitcast [2 x {} addrspace(10)*]* %4 to i8*
  %6 = alloca [2 x {} addrspace(10)*], align 16
  %7 = bitcast [2 x {} addrspace(10)*]* %6 to i8*
  %8 = alloca [2 x i64], align 8
  %9 = alloca [1 x i64], align 8
  %10 = alloca [1 x i64], align 8
  %11 = alloca [1 x i64], align 8
  %12 = bitcast [2 x i64]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 noundef 16, i8* noundef nonnull dereferenceable(16) %12)
  %13 = bitcast [1 x i64]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 noundef 8, i8* noundef nonnull dereferenceable(8) %13)
  %14 = bitcast [1 x i64]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 noundef 8, i8* noundef nonnull dereferenceable(8) %14)
  %15 = bitcast [1 x i64]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 noundef 8, i8* noundef nonnull dereferenceable(8) %15)
  %current_task199.i = getelementptr inbounds {}**, {}*** %3, i64 -14
  %16 = bitcast {}*** %current_task199.i to {}*
  %ptls_field100.i = getelementptr inbounds {}**, {}*** %3, i64 2
  %17 = bitcast {}*** %ptls_field100.i to i64***
  %ptls_load101102.i = load i64**, i64*** %17, align 8, !tbaa !16, !alias.scope !150, !noalias !153
  %18 = getelementptr inbounds i64*, i64** %ptls_load101102.i, i64 2
  %safepoint.i = load i64*, i64** %18, align 8, !tbaa !20, !alias.scope !155, !noalias !158
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint.i) #30, !dbg !160
  fence syncscope("singlethread") seq_cst
  %19 = bitcast {} addrspace(10)* %0 to i8 addrspace(10)*, !dbg !163
  %20 = addrspacecast i8 addrspace(10)* %19 to i8 addrspace(11)*, !dbg !163
  %21 = getelementptr inbounds i8, i8 addrspace(11)* %20, i64 16, !dbg !163
  %.sroa.079.0..sroa_idx.i = bitcast i8 addrspace(11)* %21 to i64 addrspace(11)*, !dbg !163
  %.sroa.079.0.copyload.i = load i64, i64 addrspace(11)* %.sroa.079.0..sroa_idx.i, align 8, !dbg !163, !tbaa !51, !alias.scope !170, !noalias !173, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.sroa.482.0..sroa_idx83.i = getelementptr inbounds i8, i8 addrspace(11)* %20, i64 24, !dbg !163
  %22 = bitcast i8 addrspace(11)* %.sroa.482.0..sroa_idx83.i to i64 addrspace(11)*, !dbg !163
  %.sroa.1.0.copyload.i = load i64, i64 addrspace(11)* %22, align 8, !dbg !163, !tbaa !51, !alias.scope !170, !noalias !173, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %23 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.sroa.079.0.copyload.i, i64 %.sroa.1.0.copyload.i) #30, !dbg !177
  %24 = extractvalue { i64, i1 } %23, 0, !dbg !177
  %25 = extractvalue { i64, i1 } %23, 1, !dbg !177
  %26 = icmp ugt i64 %.sroa.079.0.copyload.i, 9223372036854775806, !dbg !183
  %27 = or i1 %26, %25, !dbg !183
  %28 = icmp ugt i64 %.sroa.1.0.copyload.i, 9223372036854775806, !dbg !184
  %29 = or i1 %28, %27, !dbg !184
  br i1 %29, label %L13.i, label %L17.i, !dbg !185

L13.i:                                            ; preds = %entry
  %30 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657840 to {}*) to {} addrspace(10)*)) #31, !dbg !185
  %31 = bitcast {} addrspace(10)* %30 to [1 x {} addrspace(10)*] addrspace(10)*, !dbg !185, !enzyme_inactive !0
  %32 = getelementptr [1 x {} addrspace(10)*], [1 x {} addrspace(10)*] addrspace(10)* %31, i64 0, i64 0, !dbg !185
  store {} addrspace(10)* addrspacecast ({}* inttoptr (i64 127938155009344 to {}*) to {} addrspace(10)*), {} addrspace(10)* addrspace(10)* %32, align 8, !dbg !185, !tbaa !31, !alias.scope !35, !noalias !186
  %33 = addrspacecast {} addrspace(10)* %30 to {} addrspace(12)*, !dbg !185, !enzyme_inactive !0
  call void @ijl_throw({} addrspace(12)* %33) #32, !dbg !185
  unreachable, !dbg !185

L17.i:                                            ; preds = %entry
  %.not.i = icmp eq i64 %24, 0, !dbg !191
  br i1 %.not.i, label %L19.i, label %L21.i, !dbg !191

L19.i:                                            ; preds = %L17.i
  %34 = load atomic {} addrspace(10)*, {} addrspace(10)** inttoptr (i64 127938077110288 to {} addrspace(10)**) unordered, align 16, !dbg !195, !tbaa !20, !alias.scope !196, !noalias !199, !nonnull !0, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_BITS_REF !0
  br label %L23.i

L21.i:                                            ; preds = %L17.i
  %35 = call noalias "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Pointer, [-1,8,-1]:Float@double}" {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077110256 to {}*) to {} addrspace(10)*), i64 %24) #29, !dbg !201
  %36 = shl i64 %24, 3, !dbg !201
  %37 = bitcast {} addrspace(10)* %35 to <{ i64, i8* }> addrspace(10)*, !dbg !201
  %38 = getelementptr inbounds <{ i64, i8* }>, <{ i64, i8* }> addrspace(10)* %37, i64 0, i32 1, !dbg !201
  %39 = load i8*, i8* addrspace(10)* %38, align 8, !dbg !201, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  call void @llvm.memset.p0i8.i64(i8* align 8 %39, i8 noundef 0, i64 %36, i1 noundef false), !dbg !201
  %40 = call noalias "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Pointer, [-1,8,-1]:Float@double}" {} addrspace(10)* @jl_alloc_genericmemory({} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077110256 to {}*) to {} addrspace(10)*), i64 %24) #33, !dbg !201
  br label %L23.i, !dbg !201

L23.i:                                            ; preds = %L21.i, %L19.i
  %41 = phi {} addrspace(10)* [ %35, %L21.i ], [ %34, %L19.i ]
  %value_phi.i = phi {} addrspace(10)* [ %40, %L21.i ], [ %34, %L19.i ]
  %"'ipc14.i" = bitcast {} addrspace(10)* %41 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !202
  %42 = bitcast {} addrspace(10)* %value_phi.i to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !202
  %"'ipc15.i" = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %"'ipc14.i" to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !202
  %43 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %42 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !202
  %"'ipg16.i" = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %"'ipc15.i", i64 0, i32 1, !dbg !202
  %44 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %43, i64 0, i32 1, !dbg !202
  %"'ipc17.i" = bitcast {} addrspace(10)** addrspace(11)* %"'ipg16.i" to i8* addrspace(11)*, !dbg !202
  %45 = bitcast {} addrspace(10)** addrspace(11)* %44 to i8* addrspace(11)*, !dbg !202
  %"'ipl.i" = load i8*, i8* addrspace(11)* %"'ipc17.i", align 8, !dbg !202, !tbaa !20, !alias.scope !204, !noalias !207, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %46 = load i8*, i8* addrspace(11)* %45, align 8, !dbg !202, !tbaa !20, !alias.scope !209, !noalias !210, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %"'mi.i" = call noalias nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 32, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938216542032 to {}*) to {} addrspace(10)*)) #31, !dbg !211
  %47 = call noalias nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 32, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938216542032 to {}*) to {} addrspace(10)*)) #31, !dbg !211
  %"'ipc12.i" = bitcast {} addrspace(10)* %"'mi.i" to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !211
  %48 = bitcast {} addrspace(10)* %47 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !211
  %"'ipc13.i" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc12.i" to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !211
  %49 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %48 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !211
  %".repack'ipg.i" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc13.i", i64 0, i32 0, !dbg !211
  %.repack.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %49, i64 0, i32 0, !dbg !211
  store i8* %"'ipl.i", i8* addrspace(11)* %".repack'ipg.i", align 8, !dbg !211, !tbaa !81, !alias.scope !212, !noalias !215
  store i8* %46, i8* addrspace(11)* %.repack.i, align 8, !dbg !211, !tbaa !81, !alias.scope !217, !noalias !218
  %".repack104'ipg.i" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc13.i", i64 0, i32 1, !dbg !211
  %.repack104.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %49, i64 0, i32 1, !dbg !211
  store {} addrspace(10)* %41, {} addrspace(10)* addrspace(11)* %".repack104'ipg.i", align 8, !dbg !211, !tbaa !81, !alias.scope !212, !noalias !215
  store {} addrspace(10)* %value_phi.i, {} addrspace(10)* addrspace(11)* %.repack104.i, align 8, !dbg !211, !tbaa !81, !alias.scope !217, !noalias !218
  %50 = bitcast {} addrspace(10)* %47 to i8 addrspace(10)*, !dbg !211
  %51 = addrspacecast i8 addrspace(10)* %50 to i8 addrspace(11)*, !dbg !211
  %52 = getelementptr inbounds i8, i8 addrspace(11)* %51, i64 16, !dbg !211
  %.sroa.070.0..sroa_idx.i = bitcast i8 addrspace(11)* %52 to i64 addrspace(11)*, !dbg !211
  store i64 %.sroa.079.0.copyload.i, i64 addrspace(11)* %.sroa.070.0..sroa_idx.i, align 8, !dbg !211, !tbaa !51, !alias.scope !219, !noalias !220
  %.sroa.271.0..sroa_idx72.i = getelementptr inbounds i8, i8 addrspace(11)* %51, i64 24, !dbg !211
  %53 = bitcast i8 addrspace(11)* %.sroa.271.0..sroa_idx72.i to i64 addrspace(11)*, !dbg !211
  store i64 %.sroa.1.0.copyload.i, i64 addrspace(11)* %53, align 8, !dbg !211, !tbaa !51, !alias.scope !219, !noalias !220
  %"'ipc22.i" = bitcast {} addrspace(10)* %1 to { i8*, {} addrspace(10)* } addrspace(10)*
  %"'ipc23.i" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc22.i" to { i8*, {} addrspace(10)* } addrspace(11)*
  %"'ipg24.i" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc23.i", i64 0, i32 1
  %54 = icmp eq i64 %.sroa.1.0.copyload.i, 0
  %55 = icmp ult i64 %.sroa.1.0.copyload.i, 3
  %56 = call noalias nonnull dereferenceable(16) dereferenceable_or_null(16) i8* @malloc(i64 noundef 16), !dbg !211, !enzyme_cache_alloc !221
  %57 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*
  %58 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %4, i64 0, i64 0, !dbg !211
  store {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)** %58, align 16, !dbg !211, !noalias !223
  %59 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %4, i64 0, i64 1, !dbg !211
  store {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)** %59, align 8, !dbg !211, !noalias !223
  %60 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*
  %61 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %60 to { i8*, {} addrspace(10)* } addrspace(11)*
  %62 = addrspacecast i8* addrspace(10)* %57 to i8* addrspace(11)*
  %63 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %61, i64 0, i32 1
  %64 = icmp ult i64 %.sroa.1.0.copyload.i, 2
  %65 = shl nuw i64 %.sroa.079.0.copyload.i, 1
  %66 = bitcast i8* %56 to double*, !dbg !211
  %67 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %6, i64 0, i64 0, !dbg !211
  store {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)** %67, align 16, !dbg !211, !noalias !223
  %68 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %6, i64 0, i64 1, !dbg !211
  store {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)** %68, align 8, !dbg !211, !noalias !223
  %69 = call noalias nonnull dereferenceable(16) dereferenceable_or_null(16) i8* @malloc(i64 noundef 16), !dbg !211, !enzyme_cache_alloc !224
  %70 = bitcast i8* %69 to double*, !dbg !211
  %71 = call noalias nonnull dereferenceable(16) dereferenceable_or_null(16) i8* @malloc(i64 noundef 16), !dbg !211, !enzyme_cache_alloc !226
  %72 = bitcast i8* %71 to double*, !dbg !211
  %73 = bitcast {} addrspace(10)* %"'mi.i" to {} addrspace(10)** addrspace(10)*
  %74 = addrspacecast {} addrspace(10)** addrspace(10)* %73 to {} addrspace(10)** addrspace(11)*
  br label %L31.i, !dbg !211

L31.i:                                            ; preds = %load14.2.i, %L23.i
  %iv.i = phi i64 [ %iv.next.i, %load14.2.i ], [ 0, %L23.i ]
  %iv.next.i = add nuw nsw i64 %iv.i, 1
  %75 = icmp uge i64 %iv.i, %.sroa.079.0.copyload.i
  %76 = load i8*, i8* addrspace(11)* %62, align 8, !alias.scope !228, !noalias !229, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipl25.i" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %"'ipg24.i", align 8, !alias.scope !229, !noalias !228, !enzyme_type !230
  %77 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %4, i64 0, i64 %iv.i
  store {} addrspace(10)* %"'ipl25.i", {} addrspace(10)** %77, align 8, !noalias !223, !invariant.group !232
  %78 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %63, align 8, !alias.scope !228, !noalias !229, !enzyme_type !230, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %79 = bitcast i8* %76 to double*
  %80 = bitcast {} addrspace(10)* %78 to { i64, {} addrspace(10)** } addrspace(10)*
  %81 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %80 to { i64, {} addrspace(10)** } addrspace(11)*
  %82 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %81, i64 0, i32 1
  %83 = bitcast {} addrspace(10)** addrspace(11)* %82 to i8* addrspace(11)*
  %84 = bitcast i8* %76 to {} addrspace(10)**
  %85 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %78, {} addrspace(10)** noundef %84) #30, !dbg !233
  %"'ipl20.i1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %86 = load i8*, i8* addrspace(11)* %.repack.i, align 8, !alias.scope !235, !noalias !234, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipl19.i" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %".repack104'ipg.i", align 8, !alias.scope !234, !noalias !235, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %87 = getelementptr inbounds [2 x {} addrspace(10)*], [2 x {} addrspace(10)*]* %6, i64 0, i64 %iv.i
  store {} addrspace(10)* %"'ipl19.i", {} addrspace(10)** %87, align 8, !noalias !223, !invariant.group !236
  %88 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %.repack104.i, align 8, !alias.scope !235, !noalias !234, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %89 = bitcast {} addrspace(10)* %88 to i64 addrspace(10)*
  %90 = addrspacecast i64 addrspace(10)* %89 to i64 addrspace(11)*
  %91 = bitcast i8* %86 to double*
  %92 = bitcast {} addrspace(10)* %88 to { i64, {} addrspace(10)** } addrspace(10)*
  %93 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %92 to { i64, {} addrspace(10)** } addrspace(11)*
  %94 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %93, i64 0, i32 1
  %95 = bitcast {} addrspace(10)** addrspace(11)* %94 to i8* addrspace(11)*
  %96 = bitcast i8* %86 to {} addrspace(10)**
  %97 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %88, {} addrspace(10)** noundef %96) #30, !dbg !233
  %.not108.i = or i1 %54, %75, !dbg !237
  br i1 %.not108.i, label %L60.i, label %L63.i, !dbg !237

L60.i:                                            ; preds = %load14.1.i, %load14.i, %L31.i
  %value_phi4.lcssa.i = phi i64 [ 1, %load14.1.i ], [ 1, %load14.i ], [ %iv.next.i, %L31.i ]
  %value_phi6.lcssa.i = phi i64 [ 3, %load14.1.i ], [ 2, %load14.i ], [ 1, %L31.i ]
  %98 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 1
  %99 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 0
  store i64 %value_phi4.lcssa.i, i64* %99, align 8, !dbg !242, !tbaa !124, !alias.scope !126, !noalias !243
  store i64 %value_phi6.lcssa.i, i64* %98, align 8, !dbg !242, !tbaa !124, !alias.scope !126, !noalias !243
  %100 = addrspacecast [2 x i64]* %8 to [2 x i64] addrspace(11)*, !dbg !237
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call fastcc void @julia_throw_boundserror_22262({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %100) #32, !dbg !237
  unreachable, !dbg !237

L63.i:                                            ; preds = %L31.i
  %101 = bitcast {} addrspace(10)* %78 to i64 addrspace(10)*
  %102 = addrspacecast i64 addrspace(10)* %101 to i64 addrspace(11)*
  %103 = load i64, i64 addrspace(11)* %102, align 8, !dbg !244, !tbaa !104, !alias.scope !247, !noalias !250, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.not109.i = icmp ult i64 %iv.i, %103, !dbg !244
  br i1 %.not109.i, label %L87.i, label %L84.i, !dbg !244

L84.i.split.loop.exit:                            ; preds = %L63.2.i
  %104 = add i64 %iv.next.i, %65, !dbg !252
  br label %L84.i, !dbg !244

L84.i.split.loop.exit144:                         ; preds = %L63.1.i
  %105 = add i64 %iv.next.i, %.sroa.079.0.copyload.i, !dbg !252
  br label %L84.i, !dbg !244

L84.i:                                            ; preds = %L63.i, %L84.i.split.loop.exit144, %L84.i.split.loop.exit
  %.lcssa223.i = phi i64 [ %104, %L84.i.split.loop.exit ], [ %105, %L84.i.split.loop.exit144 ], [ %iv.next.i, %L63.i ], !dbg !252
  %106 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0, !dbg !244
  store i64 %.lcssa223.i, i64* %106, align 8, !dbg !244, !tbaa !124, !alias.scope !126, !noalias !243
  %107 = addrspacecast [1 x i64]* %11 to [1 x i64] addrspace(11)*, !dbg !244
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %107) #32, !dbg !244
  unreachable, !dbg !244

L87.i:                                            ; preds = %L63.i
  %108 = shl nuw i64 %103, 1, !dbg !262
  %109 = add i64 %103, %iv.i, !dbg !262
  %.not110.i = icmp ult i64 %109, %108, !dbg !262
  %110 = getelementptr inbounds double, double* %79, i64 %iv.i, !dbg !262
  %111 = load i8*, i8* addrspace(11)* %83, align 8, !dbg !262, !tbaa !20, !alias.scope !263, !noalias !264, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %112 = ptrtoint i8* %111 to i64, !dbg !262
  %113 = ptrtoint double* %110 to i64, !dbg !262
  %114 = sub i64 %113, %112, !dbg !262
  %115 = shl nuw nsw i64 %103, 3, !dbg !262
  %116 = icmp ult i64 %114, %115, !dbg !262
  %117 = and i1 %.not110.i, %116, !dbg !262
  br i1 %117, label %load.i, label %oob.i, !dbg !262

L159.i:                                           ; preds = %load14.2.i
  %118 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %"'ipl19.i", {} addrspace(10)** noundef %"'ipl20.i1"), !dbg !233
  %"'ipc90.i" = bitcast {} addrspace(10)* addrspace(13)* %118 to double addrspace(13)*, !dbg !265
  br i1 %.not.i, label %invertL159.i, label %L170.i, !dbg !267

L170.i:                                           ; preds = %L159.i
  %.not120.i = icmp eq i64 %24, 1, !dbg !273
  br i1 %.not120.i, label %L186.i, label %L191.i, !dbg !276

L186.i:                                           ; preds = %L170.i
  %119 = ptrtoint i8* %86 to i64, !dbg !277
  %120 = sub i64 %119, %160, !dbg !277
  %121 = icmp ult i64 %120, %163, !dbg !277
  br i1 %121, label %invertload26.i, label %oob22.i, !dbg !277

L191.i:                                           ; preds = %L170.i
  %122 = icmp sgt i64 %24, 15, !dbg !279
  br i1 %122, label %invertL257.i, label %L207.i, !dbg !282

L207.i:                                           ; preds = %L191.i
  %123 = ptrtoint i8* %86 to i64, !dbg !283
  %124 = sub i64 %123, %160, !dbg !283
  %125 = icmp ult i64 %124, %163, !dbg !283
  br i1 %125, label %load32.i, label %oob28.i, !dbg !283

L222.i:                                           ; preds = %load32.i
  %126 = getelementptr inbounds [1 x i64], [1 x i64]* %10, i64 0, i64 0, !dbg !285
  store i64 2, i64* %126, align 8, !dbg !285, !tbaa !124, !alias.scope !126, !noalias !243
  %127 = addrspacecast [1 x i64]* %10 to [1 x i64] addrspace(11)*, !dbg !285
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %47, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %127) #32, !dbg !285
  unreachable, !dbg !285

L225.i:                                           ; preds = %load32.i
  %128 = add nuw nsw i64 %155, 1, !dbg !287
  %.not127.i = icmp ult i64 %128, %156, !dbg !287
  %129 = getelementptr inbounds i8, i8* %86, i64 8, !dbg !287
  %130 = ptrtoint i8* %129 to i64, !dbg !287
  %131 = sub i64 %130, %160, !dbg !287
  %132 = icmp ult i64 %131, %163, !dbg !287
  %133 = and i1 %.not127.i, %132, !dbg !287
  br i1 %133, label %load37.i, label %oob33.i, !dbg !287

L235.i:                                           ; preds = %scalar.ph, %load44.i
  %iv1.i = phi i64 [ %iv.next2.i, %load44.i ], [ 0, %scalar.ph ]
  %iv.next2.i = add nuw nsw i64 %iv1.i, 1, !dbg !288
  %134 = add nuw nsw i64 %iv1.i, 2, !dbg !288
  %135 = add nuw nsw i64 %iv1.i, 3, !dbg !288
  %exitcond.not.i = icmp eq i64 %134, %155, !dbg !290
  br i1 %exitcond.not.i, label %L247.i, label %L250.i, !dbg !290

L247.i:                                           ; preds = %L235.i
  %136 = getelementptr inbounds [1 x i64], [1 x i64]* %9, i64 0, i64 0, !dbg !290
  store i64 %135, i64* %136, align 8, !dbg !290, !tbaa !124, !alias.scope !126, !noalias !243
  %137 = addrspacecast [1 x i64]* %9 to [1 x i64] addrspace(11)*, !dbg !290
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %47, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %137) #32, !dbg !290
  unreachable, !dbg !290

L250.i:                                           ; preds = %L235.i
  %138 = add nuw nsw i64 %134, %155, !dbg !291
  %.not133.i = icmp ult i64 %138, %156, !dbg !291
  %139 = getelementptr inbounds double, double* %91, i64 %134, !dbg !291
  %140 = ptrtoint double* %139 to i64, !dbg !291
  %141 = sub i64 %140, %160, !dbg !291
  %142 = icmp ult i64 %141, %163, !dbg !291
  %143 = and i1 %.not133.i, %142, !dbg !291
  br i1 %143, label %load44.i, label %oob40.i, !dbg !291

oob.i.split.loop.exit:                            ; preds = %L87.2.i
  %144 = add i64 %iv.next.i, %65, !dbg !252
  br label %oob.i

oob.i.split.loop.exit136:                         ; preds = %L87.1.i
  %145 = add i64 %iv.next.i, %.sroa.079.0.copyload.i, !dbg !252
  br label %oob.i

oob.i:                                            ; preds = %L87.i, %oob.i.split.loop.exit136, %oob.i.split.loop.exit
  %.lcssa224.i = phi i64 [ %144, %oob.i.split.loop.exit ], [ %145, %oob.i.split.loop.exit136 ], [ %iv.next.i, %L87.i ], !dbg !252
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %146 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !262
  %147 = bitcast {} addrspace(10)* %146 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !262
  %.repack111.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %147, i64 0, i32 0, !dbg !262
  store i8* %76, i8* addrspace(10)* %.repack111.i, align 8, !dbg !262, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack112.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %147, i64 0, i32 1, !dbg !262
  store {} addrspace(10)* %78, {} addrspace(10)* addrspace(10)* %.repack112.i, align 8, !dbg !262, !tbaa !31, !alias.scope !35, !noalias !186
  %148 = addrspacecast {} addrspace(10)* %146 to {} addrspace(12)*, !dbg !262
  call void @ijl_bounds_error_int({} addrspace(12)* %148, i64 %.lcssa224.i) #32, !dbg !262
  unreachable, !dbg !262

load.i:                                           ; preds = %L87.i
  %149 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %85, i64 %iv.i, !dbg !262
  %150 = bitcast {} addrspace(10)* addrspace(13)* %149 to double addrspace(13)*, !dbg !262
  %151 = load double, double addrspace(13)* %150, align 8, !dbg !262, !tbaa !143, !alias.scope !292, !noalias !295
  %152 = getelementptr inbounds double, double* %66, i64 %iv.i, !dbg !297
  store double %151, double* %152, align 8, !dbg !297, !tbaa !143, !noalias !223, !invariant.group !305
  %153 = fmul double %151, %151, !dbg !297
  %154 = fmul double %151, %153, !dbg !297
  %155 = load i64, i64 addrspace(11)* %90, align 8, !dbg !265, !tbaa !104, !range !306, !alias.scope !307, !noalias !310, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %156 = shl nuw nsw i64 %155, 1, !dbg !265
  %157 = add nuw nsw i64 %155, %iv.i, !dbg !265
  %.not114.i = icmp ult i64 %157, %156, !dbg !265
  %158 = getelementptr inbounds double, double* %91, i64 %iv.i, !dbg !265
  %159 = load i8*, i8* addrspace(11)* %95, align 8, !dbg !265, !tbaa !20, !alias.scope !312, !noalias !313, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %160 = ptrtoint i8* %159 to i64, !dbg !265
  %161 = ptrtoint double* %158 to i64, !dbg !265
  %162 = sub i64 %161, %160, !dbg !265
  %163 = shl nuw nsw i64 %155, 3, !dbg !265
  %164 = icmp ult i64 %162, %163, !dbg !265
  %165 = and i1 %.not114.i, %164, !dbg !265
  br i1 %165, label %idxend12.i, label %oob10.i, !dbg !265

oob10.i.split.loop.exit:                          ; preds = %load.2.i
  %166 = add i64 %iv.next.i, %65, !dbg !252
  br label %oob10.i

oob10.i.split.loop.exit128:                       ; preds = %load.1.i
  %167 = add i64 %iv.next.i, %.sroa.079.0.copyload.i, !dbg !252
  br label %oob10.i

oob10.i:                                          ; preds = %load.i, %oob10.i.split.loop.exit128, %oob10.i.split.loop.exit
  %.lcssa225.i = phi i64 [ %166, %oob10.i.split.loop.exit ], [ %167, %oob10.i.split.loop.exit128 ], [ %iv.next.i, %load.i ], !dbg !252
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %168 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !265
  %169 = bitcast {} addrspace(10)* %168 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !265
  %.repack115.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %169, i64 0, i32 0, !dbg !265
  store i8* %86, i8* addrspace(10)* %.repack115.i, align 8, !dbg !265, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack116.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %169, i64 0, i32 1, !dbg !265
  store {} addrspace(10)* %88, {} addrspace(10)* addrspace(10)* %.repack116.i, align 8, !dbg !265, !tbaa !31, !alias.scope !35, !noalias !186
  %170 = addrspacecast {} addrspace(10)* %168 to {} addrspace(12)*, !dbg !265
  call void @ijl_bounds_error_int({} addrspace(12)* %170, i64 %.lcssa225.i) #32, !dbg !265
  unreachable, !dbg !265

idxend12.i:                                       ; preds = %load.i
  %171 = icmp eq i64 %155, 0, !dbg !265
  br i1 %171, label %oob13.i, label %load14.i, !dbg !265

oob13.i:                                          ; preds = %idxend12.i
  %172 = addrspacecast {} addrspace(10)* %88 to {} addrspace(12)*, !dbg !265
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call void @ijl_bounds_error_int({} addrspace(12)* noundef %172, i64 noundef 1) #32, !dbg !265
  unreachable, !dbg !265

load14.i:                                         ; preds = %idxend12.i
  %173 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %97, i64 %iv.i, !dbg !265
  %174 = bitcast {} addrspace(10)* addrspace(13)* %173 to double addrspace(13)*, !dbg !265
  store double %154, double addrspace(13)* %174, align 8, !dbg !265, !tbaa !143, !alias.scope !314, !noalias !317
  br i1 %64, label %L60.i, label %L63.1.i, !dbg !237

L63.1.i:                                          ; preds = %load14.i
  %175 = add nuw i64 %iv.i, %.sroa.079.0.copyload.i, !dbg !244
  %.not109.1.i = icmp ult i64 %175, %103, !dbg !244
  br i1 %.not109.1.i, label %L87.1.i, label %L84.i.split.loop.exit144, !dbg !244

L87.1.i:                                          ; preds = %L63.1.i
  %176 = add i64 %103, %175, !dbg !262
  %.not110.1.i = icmp ult i64 %176, %108, !dbg !262
  %177 = getelementptr inbounds double, double* %79, i64 %175, !dbg !262
  %178 = ptrtoint double* %177 to i64, !dbg !262
  %179 = sub i64 %178, %112, !dbg !262
  %180 = icmp ult i64 %179, %115, !dbg !262
  %181 = and i1 %.not110.1.i, %180, !dbg !262
  br i1 %181, label %load.1.i, label %oob.i.split.loop.exit136, !dbg !262

load.1.i:                                         ; preds = %L87.1.i
  %182 = add i64 %155, %175, !dbg !265
  %.not114.1.i = icmp ult i64 %182, %156, !dbg !265
  %183 = getelementptr inbounds double, double* %91, i64 %175, !dbg !265
  %184 = ptrtoint double* %183 to i64, !dbg !265
  %185 = sub i64 %184, %160, !dbg !265
  %186 = icmp ult i64 %185, %163, !dbg !265
  %187 = and i1 %.not114.1.i, %186, !dbg !265
  br i1 %187, label %load14.1.i, label %oob10.i.split.loop.exit128, !dbg !265

load14.1.i:                                       ; preds = %load.1.i
  %188 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %85, i64 %175, !dbg !262
  %189 = bitcast {} addrspace(10)* addrspace(13)* %188 to double addrspace(13)*, !dbg !262
  %190 = load double, double addrspace(13)* %189, align 8, !dbg !262, !tbaa !143, !alias.scope !292, !noalias !295
  %191 = fmul double %190, %190, !dbg !297
  %192 = fmul double %190, %191, !dbg !297
  %193 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %97, i64 %175, !dbg !265
  %194 = bitcast {} addrspace(10)* addrspace(13)* %193 to double addrspace(13)*, !dbg !265
  store double %192, double addrspace(13)* %194, align 8, !dbg !265, !tbaa !143, !alias.scope !314, !noalias !317
  %195 = getelementptr inbounds double, double* %70, i64 %iv.i, !dbg !237
  store double %190, double* %195, align 8, !dbg !237, !tbaa !143, !noalias !223, !invariant.group !319
  br i1 %55, label %L60.i, label %L63.2.i, !dbg !237

L63.2.i:                                          ; preds = %load14.1.i
  %196 = add nuw nsw i64 %iv.i, %65, !dbg !244
  %.not109.2.i = icmp ult i64 %196, %103, !dbg !244
  br i1 %.not109.2.i, label %L87.2.i, label %L84.i.split.loop.exit, !dbg !244

L87.2.i:                                          ; preds = %L63.2.i
  %197 = add i64 %103, %196, !dbg !262
  %.not110.2.i = icmp ult i64 %197, %108, !dbg !262
  %198 = getelementptr inbounds double, double* %79, i64 %196, !dbg !262
  %199 = ptrtoint double* %198 to i64, !dbg !262
  %200 = sub i64 %199, %112, !dbg !262
  %201 = icmp ult i64 %200, %115, !dbg !262
  %202 = and i1 %.not110.2.i, %201, !dbg !262
  br i1 %202, label %load.2.i, label %oob.i.split.loop.exit, !dbg !262

load.2.i:                                         ; preds = %L87.2.i
  %203 = add i64 %155, %196, !dbg !265
  %.not114.2.i = icmp ult i64 %203, %156, !dbg !265
  %204 = getelementptr inbounds double, double* %91, i64 %196, !dbg !265
  %205 = ptrtoint double* %204 to i64, !dbg !265
  %206 = sub i64 %205, %160, !dbg !265
  %207 = icmp ult i64 %206, %163, !dbg !265
  %208 = and i1 %.not114.2.i, %207, !dbg !265
  br i1 %208, label %load14.2.i, label %oob10.i.split.loop.exit, !dbg !265

load14.2.i:                                       ; preds = %load.2.i
  %209 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %85, i64 %196, !dbg !262
  %210 = bitcast {} addrspace(10)* addrspace(13)* %209 to double addrspace(13)*, !dbg !262
  %211 = load double, double addrspace(13)* %210, align 8, !dbg !262, !tbaa !143, !alias.scope !292, !noalias !295
  %212 = fmul double %211, %211, !dbg !297
  %213 = fmul double %211, %212, !dbg !297
  %214 = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %97, i64 %196, !dbg !265
  %215 = bitcast {} addrspace(10)* addrspace(13)* %214 to double addrspace(13)*, !dbg !265
  store double %213, double addrspace(13)* %215, align 8, !dbg !265, !tbaa !143, !alias.scope !314, !noalias !317
  %216 = getelementptr inbounds double, double* %72, i64 %iv.i, !dbg !320
  store double %211, double* %216, align 8, !dbg !320, !tbaa !143, !noalias !223, !invariant.group !324
  %.not119.i = icmp eq i64 %iv.next.i, 2, !dbg !320
  br i1 %.not119.i, label %L159.i, label %L31.i, !dbg !325

oob22.i:                                          ; preds = %L186.i
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %217 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !277
  %218 = bitcast {} addrspace(10)* %217 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !277
  %.repack121.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %218, i64 0, i32 0, !dbg !277
  store i8* %86, i8* addrspace(10)* %.repack121.i, align 8, !dbg !277, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack122.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %218, i64 0, i32 1, !dbg !277
  store {} addrspace(10)* %88, {} addrspace(10)* addrspace(10)* %.repack122.i, align 8, !dbg !277, !tbaa !31, !alias.scope !35, !noalias !186
  %219 = addrspacecast {} addrspace(10)* %217 to {} addrspace(12)*, !dbg !277
  call void @ijl_bounds_error_int({} addrspace(12)* %219, i64 noundef 1) #32, !dbg !277
  unreachable, !dbg !277

oob28.i:                                          ; preds = %L207.i
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %220 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !283
  %221 = bitcast {} addrspace(10)* %220 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !283
  %.repack124.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %221, i64 0, i32 0, !dbg !283
  store i8* %86, i8* addrspace(10)* %.repack124.i, align 8, !dbg !283, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack125.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %221, i64 0, i32 1, !dbg !283
  store {} addrspace(10)* %88, {} addrspace(10)* addrspace(10)* %.repack125.i, align 8, !dbg !283, !tbaa !31, !alias.scope !35, !noalias !186
  %222 = addrspacecast {} addrspace(10)* %220 to {} addrspace(12)*, !dbg !283
  call void @ijl_bounds_error_int({} addrspace(12)* %222, i64 noundef 1) #32, !dbg !283
  unreachable, !dbg !283

load32.i:                                         ; preds = %L207.i
  %223 = icmp ult i64 %155, 2, !dbg !285
  br i1 %223, label %L222.i, label %L225.i, !dbg !285

oob33.i:                                          ; preds = %L225.i
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %224 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !287
  %225 = bitcast {} addrspace(10)* %224 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !287
  %.repack128.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %225, i64 0, i32 0, !dbg !287
  store i8* %86, i8* addrspace(10)* %.repack128.i, align 8, !dbg !287, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack129.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %225, i64 0, i32 1, !dbg !287
  store {} addrspace(10)* %88, {} addrspace(10)* addrspace(10)* %.repack129.i, align 8, !dbg !287, !tbaa !31, !alias.scope !35, !noalias !186
  %226 = addrspacecast {} addrspace(10)* %224 to {} addrspace(12)*, !dbg !287
  call void @ijl_bounds_error_int({} addrspace(12)* %226, i64 noundef 2) #32, !dbg !287
  unreachable, !dbg !287

load37.i:                                         ; preds = %L225.i
  %.not131178.i = icmp sgt i64 %24, 2, !dbg !326
  br i1 %.not131178.i, label %scalar.ph, label %invertload37.i, !dbg !328

scalar.ph:                                        ; preds = %load37.i
  %227 = add nsw i64 %24, -3, !dbg !290
  br label %L235.i, !dbg !290

oob40.i:                                          ; preds = %L250.i
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  %228 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %16, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !291
  %229 = bitcast {} addrspace(10)* %228 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !291
  %.repack134.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %229, i64 0, i32 0, !dbg !291
  store i8* %86, i8* addrspace(10)* %.repack134.i, align 8, !dbg !291, !tbaa !31, !alias.scope !35, !noalias !186
  %.repack135.i = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %229, i64 0, i32 1, !dbg !291
  store {} addrspace(10)* %88, {} addrspace(10)* addrspace(10)* %.repack135.i, align 8, !dbg !291, !tbaa !31, !alias.scope !35, !noalias !186
  %230 = addrspacecast {} addrspace(10)* %228 to {} addrspace(12)*, !dbg !291
  call void @ijl_bounds_error_int({} addrspace(12)* %230, i64 %135) #32, !dbg !291
  unreachable, !dbg !291

load44.i:                                         ; preds = %L250.i
  %exitcond285.not.i = icmp eq i64 %135, %24, !dbg !326
  br i1 %exitcond285.not.i, label %invertL262.loopexit.i, label %L235.i, !dbg !328, !llvm.loop !329

invertL159.i:                                     ; preds = %L159.i, %invertload37.i, %invertL257.i, %invertload26.i
  %231 = bitcast {} addrspace(10)* %1 to {} addrspace(10)** addrspace(10)*
  %232 = addrspacecast {} addrspace(10)** addrspace(10)* %231 to {} addrspace(10)** addrspace(11)*
  %233 = load {} addrspace(10)*, {} addrspace(10)** %68, align 8, !alias.scope !234, !noalias !235, !invariant.group !236, !enzyme_type !230
  %"'ipl20_unwrap74.i2" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %234 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %233, {} addrspace(10)** noundef %"'ipl20_unwrap74.i2"), !dbg !233
  %_unwrap78.i = or i64 %65, 1, !dbg !265
  %"'ipg72_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %234, i64 %_unwrap78.i, !dbg !265
  %"'ipc73_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg72_unwrap.i" to double addrspace(13)*, !dbg !265
  %235 = load double, double addrspace(13)* %"'ipc73_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333
  store double 0.000000e+00, double addrspace(13)* %"'ipc73_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %236 = getelementptr inbounds i8, i8* %71, i64 8, !dbg !297
  %237 = bitcast i8* %236 to double*, !dbg !297
  %238 = load double, double* %237, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !324
  %_unwrap83.i = fmul double %238, %238, !dbg !297
  %239 = fmul fast double %235, 3.000000e+00, !dbg !297
  %240 = fmul fast double %239, %_unwrap83.i, !dbg !297
  %241 = load {} addrspace(10)*, {} addrspace(10)** %59, align 8, !alias.scope !229, !noalias !228, !invariant.group !232, !enzyme_type !230
  %"'ipl28_unwrap88.i3" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %242 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %241, {} addrspace(10)** noundef %"'ipl28_unwrap88.i3"), !dbg !233
  %"'ipg86_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %242, i64 %_unwrap78.i, !dbg !262
  %"'ipc87_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg86_unwrap.i" to double addrspace(13)*, !dbg !262
  %243 = load double, double addrspace(13)* %"'ipc87_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %244 = fadd fast double %243, %240, !dbg !262
  store double %244, double addrspace(13)* %"'ipc87_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  %"'ipl20_unwrap55.i4" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %245 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %233, {} addrspace(10)** noundef %"'ipl20_unwrap55.i4"), !dbg !233
  %_unwrap59.i = add i64 %.sroa.079.0.copyload.i, 1, !dbg !265
  %"'ipg53_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %245, i64 %_unwrap59.i, !dbg !265
  %"'ipc54_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg53_unwrap.i" to double addrspace(13)*, !dbg !265
  %246 = load double, double addrspace(13)* %"'ipc54_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333
  store double 0.000000e+00, double addrspace(13)* %"'ipc54_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %247 = getelementptr inbounds i8, i8* %69, i64 8, !dbg !297
  %248 = bitcast i8* %247 to double*, !dbg !297
  %249 = load double, double* %248, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !319
  %_unwrap64.i = fmul double %249, %249, !dbg !297
  %250 = fmul fast double %246, 3.000000e+00, !dbg !297
  %251 = fmul fast double %250, %_unwrap64.i, !dbg !297
  %"'ipl28_unwrap69.i5" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %252 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %241, {} addrspace(10)** noundef %"'ipl28_unwrap69.i5"), !dbg !233
  %"'ipg67_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %252, i64 %_unwrap59.i, !dbg !262
  %"'ipc68_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg67_unwrap.i" to double addrspace(13)*, !dbg !262
  %253 = load double, double addrspace(13)* %"'ipc68_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %254 = fadd fast double %253, %251, !dbg !262
  store double %254, double addrspace(13)* %"'ipc68_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  %"'ipl20_unwrap.i6" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %255 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %233, {} addrspace(10)** noundef %"'ipl20_unwrap.i6"), !dbg !233
  %"'ipg48_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %255, i64 1, !dbg !265
  %"'ipc49_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg48_unwrap.i" to double addrspace(13)*, !dbg !265
  %256 = load double, double addrspace(13)* %"'ipc49_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333, !enzyme_type !339, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Float64 !0
  store double 0.000000e+00, double addrspace(13)* %"'ipc49_unwrap.i", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %257 = getelementptr inbounds i8, i8* %56, i64 8, !dbg !297
  %258 = bitcast i8* %257 to double*, !dbg !297
  %259 = load double, double* %258, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !305
  %_unwrap41.i = fmul double %259, %259, !dbg !297
  %260 = fmul fast double %256, 3.000000e+00, !dbg !297
  %261 = fmul fast double %260, %_unwrap41.i, !dbg !297
  %"'ipl28_unwrap.i7" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %262 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %241, {} addrspace(10)** noundef %"'ipl28_unwrap.i7"), !dbg !233
  %"'ipg44_unwrap.i" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %262, i64 1, !dbg !262
  %"'ipc45_unwrap.i" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg44_unwrap.i" to double addrspace(13)*, !dbg !262
  %263 = load double, double addrspace(13)* %"'ipc45_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %264 = fadd fast double %263, %261, !dbg !262
  store double %264, double addrspace(13)* %"'ipc45_unwrap.i", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  %265 = load {} addrspace(10)*, {} addrspace(10)** %67, align 16, !alias.scope !234, !noalias !235, !invariant.group !236, !enzyme_type !230
  %"'ipl20_unwrap74.i2.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %266 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %265, {} addrspace(10)** noundef %"'ipl20_unwrap74.i2.1"), !dbg !233
  %"'ipg72_unwrap.i.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %266, i64 %65, !dbg !265
  %"'ipc73_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg72_unwrap.i.1" to double addrspace(13)*, !dbg !265
  %267 = load double, double addrspace(13)* %"'ipc73_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333
  store double 0.000000e+00, double addrspace(13)* %"'ipc73_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %268 = load double, double* %72, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !324
  %_unwrap83.i.1 = fmul double %268, %268, !dbg !297
  %269 = fmul fast double %267, 3.000000e+00, !dbg !297
  %270 = fmul fast double %269, %_unwrap83.i.1, !dbg !297
  %271 = load {} addrspace(10)*, {} addrspace(10)** %58, align 16, !alias.scope !229, !noalias !228, !invariant.group !232, !enzyme_type !230
  %"'ipl28_unwrap88.i3.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %272 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %271, {} addrspace(10)** noundef %"'ipl28_unwrap88.i3.1"), !dbg !233
  %"'ipg86_unwrap.i.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %272, i64 %65, !dbg !262
  %"'ipc87_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg86_unwrap.i.1" to double addrspace(13)*, !dbg !262
  %273 = load double, double addrspace(13)* %"'ipc87_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %274 = fadd fast double %273, %270, !dbg !262
  store double %274, double addrspace(13)* %"'ipc87_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  %"'ipl20_unwrap55.i4.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %275 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %265, {} addrspace(10)** noundef %"'ipl20_unwrap55.i4.1"), !dbg !233
  %"'ipg53_unwrap.i.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %275, i64 %.sroa.079.0.copyload.i, !dbg !265
  %"'ipc54_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg53_unwrap.i.1" to double addrspace(13)*, !dbg !265
  %276 = load double, double addrspace(13)* %"'ipc54_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333
  store double 0.000000e+00, double addrspace(13)* %"'ipc54_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %277 = load double, double* %70, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !319
  %_unwrap64.i.1 = fmul double %277, %277, !dbg !297
  %278 = fmul fast double %276, 3.000000e+00, !dbg !297
  %279 = fmul fast double %278, %_unwrap64.i.1, !dbg !297
  %"'ipl28_unwrap69.i5.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %280 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %271, {} addrspace(10)** noundef %"'ipl28_unwrap69.i5.1"), !dbg !233
  %"'ipg67_unwrap.i.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %280, i64 %.sroa.079.0.copyload.i, !dbg !262
  %"'ipc68_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg67_unwrap.i.1" to double addrspace(13)*, !dbg !262
  %281 = load double, double addrspace(13)* %"'ipc68_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %282 = fadd fast double %281, %279, !dbg !262
  store double %282, double addrspace(13)* %"'ipc68_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  %"'ipl20_unwrap.i6.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %74, align 8, !alias.scope !234, !noalias !235, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %283 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %265, {} addrspace(10)** noundef %"'ipl20_unwrap.i6.1"), !dbg !233
  %"'ipc49_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %283 to double addrspace(13)*, !dbg !265
  %284 = load double, double addrspace(13)* %"'ipc49_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !333, !enzyme_type !339, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Float64 !0
  store double 0.000000e+00, double addrspace(13)* %"'ipc49_unwrap.i.1", align 8, !dbg !265, !tbaa !143, !alias.scope !332, !noalias !334
  %285 = load double, double* %66, align 8, !dbg !262, !tbaa !143, !alias.scope !35, !noalias !335, !invariant.group !305
  %_unwrap41.i.1 = fmul double %285, %285, !dbg !297
  %286 = fmul fast double %284, 3.000000e+00, !dbg !297
  %287 = fmul fast double %286, %_unwrap41.i.1, !dbg !297
  %"'ipl28_unwrap.i7.1" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %232, align 8, !alias.scope !229, !noalias !228, !enzyme_nocache !0
  %288 = call {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %271, {} addrspace(10)** noundef %"'ipl28_unwrap.i7.1"), !dbg !233
  %"'ipc45_unwrap.i.1" = bitcast {} addrspace(10)* addrspace(13)* %288 to double addrspace(13)*, !dbg !262
  %289 = load double, double addrspace(13)* %"'ipc45_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !337
  %290 = fadd fast double %289, %287, !dbg !262
  store double %290, double addrspace(13)* %"'ipc45_unwrap.i.1", align 8, !dbg !262, !tbaa !143, !alias.scope !336, !noalias !338
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %5)
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %7)
  call void @free(i8* noundef nonnull %56), !dbg !233, !enzyme_cache_free !221
  call void @free(i8* noundef nonnull %69), !dbg !233, !enzyme_cache_free !224
  call void @free(i8* noundef nonnull %71), !dbg !233, !enzyme_cache_free !226
  fence syncscope("singlethread") seq_cst
  call void @llvm.lifetime.end.p0i8(i64 noundef 16, i8* noundef nonnull %12)
  call void @llvm.lifetime.end.p0i8(i64 noundef 8, i8* noundef nonnull %13)
  call void @llvm.lifetime.end.p0i8(i64 noundef 8, i8* noundef nonnull %14)
  call void @llvm.lifetime.end.p0i8(i64 noundef 8, i8* noundef nonnull %15)
  ret void

invertL257.i:                                     ; preds = %L191.i
  call fastcc void @diffejulia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %47, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'mi.i", i64 noundef signext 1, i64 signext %24, double %2), !dbg !340
  br label %invertL159.i

invertL262.loopexit.i:                            ; preds = %load44.i
  %291 = add i64 %24, 2
  %xtraiter = and i64 %291, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %invertload44.i.prol.loopexit, label %invertload44.i.prol

invertload44.i.prol:                              ; preds = %invertL262.loopexit.i, %invertload44.i.prol
  %"'de.i.1.prol" = phi double [ %296, %invertload44.i.prol ], [ 0.000000e+00, %invertL262.loopexit.i ]
  %storemerge11.prol = phi i64 [ %297, %invertload44.i.prol ], [ %227, %invertL262.loopexit.i ]
  %prol.iter = phi i64 [ %prol.iter.next, %invertload44.i.prol ], [ 0, %invertL262.loopexit.i ]
  %_unwrap105.i.prol = add nuw nsw i64 %storemerge11.prol, 2, !dbg !291
  %"'ipg103_unwrap.i.prol" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %118, i64 %_unwrap105.i.prol, !dbg !291
  %"'ipc104_unwrap.i.prol" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg103_unwrap.i.prol" to double addrspace(13)*, !dbg !291
  %292 = load double, double addrspace(13)* %"'ipc104_unwrap.i.prol", align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %293 = fadd fast double %292, %2, !dbg !291
  store double %293, double addrspace(13)* %"'ipc104_unwrap.i.prol", align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %294 = icmp eq i64 %storemerge11.prol, 0
  %295 = select fast i1 %294, double %2, double 0.000000e+00
  %296 = fadd fast double %295, %"'de.i.1.prol"
  %297 = add nsw i64 %storemerge11.prol, -1
  %prol.iter.next = add nuw nsw i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp.not, label %invertload44.i.prol.loopexit, label %invertload44.i.prol, !llvm.loop !345

invertload44.i.prol.loopexit:                     ; preds = %invertload44.i.prol, %invertL262.loopexit.i
  %.lcssa.unr = phi double [ undef, %invertL262.loopexit.i ], [ %296, %invertload44.i.prol ]
  %"'de.i.1.unr" = phi double [ 0.000000e+00, %invertL262.loopexit.i ], [ %296, %invertload44.i.prol ]
  %storemerge11.unr = phi i64 [ %227, %invertL262.loopexit.i ], [ %297, %invertload44.i.prol ]
  %298 = icmp ult i64 %227, 3
  br i1 %298, label %invertload37.i, label %invertload44.i.preheader

invertload44.i.preheader:                         ; preds = %invertload44.i.prol.loopexit
  %299 = add i64 %storemerge11.unr, -3
  %300 = lshr i64 %299, 2
  %301 = add nuw nsw i64 %300, 1
  %min.iters.check546 = icmp ult i64 %299, 60
  br i1 %min.iters.check546, label %invertload44.i.preheader.scalar.ph545_crit_edge, label %vector.ph547

invertload44.i.preheader.scalar.ph545_crit_edge:  ; preds = %invertload44.i.preheader
  %.pre = insertelement <4 x double> poison, double %2, i64 0
  %.pre265 = shufflevector <4 x double> %.pre, <4 x double> poison, <4 x i32> zeroinitializer
  br label %scalar.ph545

vector.ph547:                                     ; preds = %invertload44.i.preheader
  %n.vec549 = and i64 %301, -16
  %302 = insertelement <4 x double> <double poison, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00>, double %"'de.i.1.unr", i64 0
  %.splatinsert = insertelement <4 x i64> poison, i64 %storemerge11.unr, i64 0
  %.splat = shufflevector <4 x i64> %.splatinsert, <4 x i64> poison, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %.splat, <i64 0, i64 -4, i64 -8, i64 -12>
  %broadcast.splatinsert = insertelement <4 x double> poison, double %2, i64 0
  %broadcast.splat = shufflevector <4 x double> %broadcast.splatinsert, <4 x double> poison, <4 x i32> zeroinitializer
  %303 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %118, i64 -15
  %304 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %118, i64 -12
  br label %vector.body551

vector.body551:                                   ; preds = %vector.body551, %vector.ph547
  %index552 = phi i64 [ 0, %vector.ph547 ], [ %index.next617, %vector.body551 ]
  %vec.phi = phi <4 x double> [ %302, %vector.ph547 ], [ %402, %vector.body551 ]
  %vec.phi553 = phi <4 x double> [ zeroinitializer, %vector.ph547 ], [ %403, %vector.body551 ]
  %vec.phi554 = phi <4 x double> [ zeroinitializer, %vector.ph547 ], [ %404, %vector.body551 ]
  %vec.phi555 = phi <4 x double> [ zeroinitializer, %vector.ph547 ], [ %405, %vector.body551 ]
  %vec.ind = phi <4 x i64> [ %induction, %vector.ph547 ], [ %vec.ind.next, %vector.body551 ]
  %step.add = add <4 x i64> %vec.ind, <i64 -16, i64 -16, i64 -16, i64 -16>
  %step.add556 = add <4 x i64> %vec.ind, <i64 -32, i64 -32, i64 -32, i64 -32>
  %step.add557 = add <4 x i64> %vec.ind, <i64 -48, i64 -48, i64 -48, i64 -48>
  %305 = shl i64 %index552, 2
  %offset.idx = sub i64 %storemerge11.unr, %305
  %306 = add nuw nsw i64 %offset.idx, 2, !dbg !291
  %307 = add i64 %offset.idx, -14, !dbg !291
  %308 = add i64 %offset.idx, -30, !dbg !291
  %309 = add i64 %offset.idx, -46, !dbg !291
  %310 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %303, i64 %306, !dbg !291
  %311 = bitcast {} addrspace(10)* addrspace(13)* %310 to <16 x double> addrspace(13)*, !dbg !291
  %312 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %303, i64 %307, !dbg !291
  %313 = bitcast {} addrspace(10)* addrspace(13)* %312 to <16 x double> addrspace(13)*, !dbg !291
  %314 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %303, i64 %308, !dbg !291
  %315 = bitcast {} addrspace(10)* addrspace(13)* %314 to <16 x double> addrspace(13)*, !dbg !291
  %316 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %303, i64 %309, !dbg !291
  %317 = bitcast {} addrspace(10)* addrspace(13)* %316 to <16 x double> addrspace(13)*, !dbg !291
  %wide.vec = load <16 x double>, <16 x double> addrspace(13)* %311, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %wide.vec559 = load <16 x double>, <16 x double> addrspace(13)* %313, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %wide.vec560 = load <16 x double>, <16 x double> addrspace(13)* %315, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %wide.vec561 = load <16 x double>, <16 x double> addrspace(13)* %317, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %strided.vec = shufflevector <16 x double> %wide.vec, <16 x double> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>, !dbg !291
  %reverse = shufflevector <4 x double> %strided.vec, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec562 = shufflevector <16 x double> %wide.vec559, <16 x double> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>, !dbg !291
  %reverse563 = shufflevector <4 x double> %strided.vec562, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec564 = shufflevector <16 x double> %wide.vec560, <16 x double> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>, !dbg !291
  %reverse565 = shufflevector <4 x double> %strided.vec564, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec566 = shufflevector <16 x double> %wide.vec561, <16 x double> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>, !dbg !291
  %reverse567 = shufflevector <4 x double> %strided.vec566, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec568 = shufflevector <16 x double> %wide.vec, <16 x double> poison, <4 x i32> <i32 1, i32 5, i32 9, i32 13>, !dbg !291
  %reverse569 = shufflevector <4 x double> %strided.vec568, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec570 = shufflevector <16 x double> %wide.vec559, <16 x double> poison, <4 x i32> <i32 1, i32 5, i32 9, i32 13>, !dbg !291
  %reverse571 = shufflevector <4 x double> %strided.vec570, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec572 = shufflevector <16 x double> %wide.vec560, <16 x double> poison, <4 x i32> <i32 1, i32 5, i32 9, i32 13>, !dbg !291
  %reverse573 = shufflevector <4 x double> %strided.vec572, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec574 = shufflevector <16 x double> %wide.vec561, <16 x double> poison, <4 x i32> <i32 1, i32 5, i32 9, i32 13>, !dbg !291
  %reverse575 = shufflevector <4 x double> %strided.vec574, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec576 = shufflevector <16 x double> %wide.vec, <16 x double> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>, !dbg !291
  %reverse577 = shufflevector <4 x double> %strided.vec576, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec578 = shufflevector <16 x double> %wide.vec559, <16 x double> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>, !dbg !291
  %reverse579 = shufflevector <4 x double> %strided.vec578, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec580 = shufflevector <16 x double> %wide.vec560, <16 x double> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>, !dbg !291
  %reverse581 = shufflevector <4 x double> %strided.vec580, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec582 = shufflevector <16 x double> %wide.vec561, <16 x double> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>, !dbg !291
  %reverse583 = shufflevector <4 x double> %strided.vec582, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec584 = shufflevector <16 x double> %wide.vec, <16 x double> poison, <4 x i32> <i32 3, i32 7, i32 11, i32 15>, !dbg !291
  %reverse585 = shufflevector <4 x double> %strided.vec584, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec586 = shufflevector <16 x double> %wide.vec559, <16 x double> poison, <4 x i32> <i32 3, i32 7, i32 11, i32 15>, !dbg !291
  %reverse587 = shufflevector <4 x double> %strided.vec586, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec588 = shufflevector <16 x double> %wide.vec560, <16 x double> poison, <4 x i32> <i32 3, i32 7, i32 11, i32 15>, !dbg !291
  %reverse589 = shufflevector <4 x double> %strided.vec588, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %strided.vec590 = shufflevector <16 x double> %wide.vec561, <16 x double> poison, <4 x i32> <i32 3, i32 7, i32 11, i32 15>, !dbg !291
  %reverse591 = shufflevector <4 x double> %strided.vec590, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %318 = fadd fast <4 x double> %reverse585, %broadcast.splat, !dbg !291
  %319 = fadd fast <4 x double> %reverse587, %broadcast.splat, !dbg !291
  %320 = fadd fast <4 x double> %reverse589, %broadcast.splat, !dbg !291
  %321 = fadd fast <4 x double> %reverse591, %broadcast.splat, !dbg !291
  %322 = icmp eq <4 x i64> %vec.ind, zeroinitializer
  %323 = icmp eq <4 x i64> %step.add, zeroinitializer
  %324 = icmp eq <4 x i64> %step.add556, zeroinitializer
  %325 = icmp eq <4 x i64> %step.add557, zeroinitializer
  %326 = select <4 x i1> %322, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %327 = select <4 x i1> %323, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %328 = select <4 x i1> %324, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %329 = select <4 x i1> %325, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %330 = fadd fast <4 x double> %326, %vec.phi
  %331 = fadd fast <4 x double> %327, %vec.phi553
  %332 = fadd fast <4 x double> %328, %vec.phi554
  %333 = fadd fast <4 x double> %329, %vec.phi555
  %334 = add nsw <4 x i64> %vec.ind, <i64 -1, i64 -1, i64 -1, i64 -1>
  %335 = add <4 x i64> %vec.ind, <i64 -17, i64 -17, i64 -17, i64 -17>
  %336 = add <4 x i64> %vec.ind, <i64 -33, i64 -33, i64 -33, i64 -33>
  %337 = add <4 x i64> %vec.ind, <i64 -49, i64 -49, i64 -49, i64 -49>
  %338 = fadd fast <4 x double> %reverse577, %broadcast.splat, !dbg !291
  %339 = fadd fast <4 x double> %reverse579, %broadcast.splat, !dbg !291
  %340 = fadd fast <4 x double> %reverse581, %broadcast.splat, !dbg !291
  %341 = fadd fast <4 x double> %reverse583, %broadcast.splat, !dbg !291
  %342 = icmp eq <4 x i64> %334, zeroinitializer
  %343 = icmp eq <4 x i64> %335, zeroinitializer
  %344 = icmp eq <4 x i64> %336, zeroinitializer
  %345 = icmp eq <4 x i64> %337, zeroinitializer
  %346 = select <4 x i1> %342, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %347 = select <4 x i1> %343, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %348 = select <4 x i1> %344, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %349 = select <4 x i1> %345, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %350 = fadd fast <4 x double> %331, %347
  %351 = fadd fast <4 x double> %332, %348
  %352 = fadd fast <4 x double> %333, %349
  %353 = fadd fast <4 x double> %reverse569, %broadcast.splat, !dbg !291
  %354 = fadd fast <4 x double> %reverse571, %broadcast.splat, !dbg !291
  %355 = fadd fast <4 x double> %reverse573, %broadcast.splat, !dbg !291
  %356 = fadd fast <4 x double> %reverse575, %broadcast.splat, !dbg !291
  %357 = icmp eq <4 x i64> %vec.ind, <i64 2, i64 2, i64 2, i64 2>
  %358 = icmp eq <4 x i64> %step.add, <i64 2, i64 2, i64 2, i64 2>
  %359 = icmp eq <4 x i64> %step.add556, <i64 2, i64 2, i64 2, i64 2>
  %360 = icmp eq <4 x i64> %step.add557, <i64 2, i64 2, i64 2, i64 2>
  %361 = select <4 x i1> %357, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %362 = select <4 x i1> %358, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %363 = select <4 x i1> %359, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %364 = select <4 x i1> %360, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %365 = fadd fast <4 x double> %350, %362
  %366 = fadd fast <4 x double> %351, %363
  %367 = fadd fast <4 x double> %352, %364
  %368 = extractelement <4 x i64> %334, i64 0, !dbg !291
  %369 = extractelement <4 x i64> %335, i64 0, !dbg !291
  %370 = extractelement <4 x i64> %336, i64 0, !dbg !291
  %371 = extractelement <4 x i64> %337, i64 0, !dbg !291
  %372 = fadd fast <4 x double> %reverse, %broadcast.splat, !dbg !291
  %373 = fadd fast <4 x double> %reverse563, %broadcast.splat, !dbg !291
  %374 = fadd fast <4 x double> %reverse565, %broadcast.splat, !dbg !291
  %375 = fadd fast <4 x double> %reverse567, %broadcast.splat, !dbg !291
  %376 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %304, i64 %368, !dbg !291
  %377 = bitcast {} addrspace(10)* addrspace(13)* %376 to <16 x double> addrspace(13)*, !dbg !291
  %378 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %304, i64 %369, !dbg !291
  %379 = bitcast {} addrspace(10)* addrspace(13)* %378 to <16 x double> addrspace(13)*, !dbg !291
  %380 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %304, i64 %370, !dbg !291
  %381 = bitcast {} addrspace(10)* addrspace(13)* %380 to <16 x double> addrspace(13)*, !dbg !291
  %382 = getelementptr {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %304, i64 %371, !dbg !291
  %383 = bitcast {} addrspace(10)* addrspace(13)* %382 to <16 x double> addrspace(13)*, !dbg !291
  %reverse598 = shufflevector <4 x double> %372, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse599 = shufflevector <4 x double> %353, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse600 = shufflevector <4 x double> %338, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse601 = shufflevector <4 x double> %318, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %384 = shufflevector <4 x double> %reverse598, <4 x double> %reverse599, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %385 = shufflevector <4 x double> %reverse600, <4 x double> %reverse601, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %interleaved.vec = shufflevector <8 x double> %384, <8 x double> %385, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>, !dbg !291
  store <16 x double> %interleaved.vec, <16 x double> addrspace(13)* %377, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %reverse602 = shufflevector <4 x double> %373, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse603 = shufflevector <4 x double> %354, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse604 = shufflevector <4 x double> %339, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse605 = shufflevector <4 x double> %319, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %386 = shufflevector <4 x double> %reverse602, <4 x double> %reverse603, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %387 = shufflevector <4 x double> %reverse604, <4 x double> %reverse605, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %interleaved.vec606 = shufflevector <8 x double> %386, <8 x double> %387, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>, !dbg !291
  store <16 x double> %interleaved.vec606, <16 x double> addrspace(13)* %379, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %reverse607 = shufflevector <4 x double> %374, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse608 = shufflevector <4 x double> %355, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse609 = shufflevector <4 x double> %340, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse610 = shufflevector <4 x double> %320, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %388 = shufflevector <4 x double> %reverse607, <4 x double> %reverse608, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %389 = shufflevector <4 x double> %reverse609, <4 x double> %reverse610, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %interleaved.vec611 = shufflevector <8 x double> %388, <8 x double> %389, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>, !dbg !291
  store <16 x double> %interleaved.vec611, <16 x double> addrspace(13)* %381, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %reverse612 = shufflevector <4 x double> %375, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse613 = shufflevector <4 x double> %356, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse614 = shufflevector <4 x double> %341, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %reverse615 = shufflevector <4 x double> %321, <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !291
  %390 = shufflevector <4 x double> %reverse612, <4 x double> %reverse613, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %391 = shufflevector <4 x double> %reverse614, <4 x double> %reverse615, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !291
  %interleaved.vec616 = shufflevector <8 x double> %390, <8 x double> %391, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>, !dbg !291
  store <16 x double> %interleaved.vec616, <16 x double> addrspace(13)* %383, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %392 = icmp eq <4 x i64> %vec.ind, <i64 3, i64 3, i64 3, i64 3>
  %393 = icmp eq <4 x i64> %step.add, <i64 3, i64 3, i64 3, i64 3>
  %394 = icmp eq <4 x i64> %step.add556, <i64 3, i64 3, i64 3, i64 3>
  %395 = icmp eq <4 x i64> %step.add557, <i64 3, i64 3, i64 3, i64 3>
  %396 = select <4 x i1> %392, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %397 = select <4 x i1> %393, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %398 = select <4 x i1> %394, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %399 = select <4 x i1> %395, <4 x double> %broadcast.splat, <4 x double> zeroinitializer
  %400 = fadd fast <4 x double> %330, %361
  %401 = fadd fast <4 x double> %400, %396
  %402 = fadd fast <4 x double> %401, %346
  %403 = fadd fast <4 x double> %365, %397
  %404 = fadd fast <4 x double> %366, %398
  %405 = fadd fast <4 x double> %367, %399
  %index.next617 = add nuw i64 %index552, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 -64, i64 -64, i64 -64, i64 -64>
  %406 = icmp eq i64 %index.next617, %n.vec549
  br i1 %406, label %middle.block544, label %vector.body551, !llvm.loop !347

middle.block544:                                  ; preds = %vector.body551
  %407 = shl i64 %n.vec549, 2
  %ind.end = sub i64 %storemerge11.unr, %407
  %bin.rdx = fadd fast <4 x double> %403, %402
  %bin.rdx618 = fadd fast <4 x double> %bin.rdx, %404
  %bin.rdx619 = fadd fast <4 x double> %bin.rdx618, %405
  %408 = call fast double @llvm.vector.reduce.fadd.v4f64(double noundef -0.000000e+00, <4 x double> %bin.rdx619)
  %cmp.n = icmp eq i64 %301, %n.vec549
  br i1 %cmp.n, label %invertload37.i, label %scalar.ph545

scalar.ph545:                                     ; preds = %invertload44.i.preheader.scalar.ph545_crit_edge, %middle.block544
  %.pre-phi266 = phi <4 x double> [ %.pre265, %invertload44.i.preheader.scalar.ph545_crit_edge ], [ %broadcast.splat, %middle.block544 ]
  %bc.resume.val550 = phi i64 [ %storemerge11.unr, %invertload44.i.preheader.scalar.ph545_crit_edge ], [ %ind.end, %middle.block544 ]
  %bc.merge.rdx = phi double [ %"'de.i.1.unr", %invertload44.i.preheader.scalar.ph545_crit_edge ], [ %408, %middle.block544 ]
  br label %invertload44.i

invertload26.i:                                   ; preds = %L186.i
  %409 = load double, double addrspace(13)* %"'ipc90.i", align 8, !dbg !277, !tbaa !143, !alias.scope !332, !noalias !343, !enzyme_type !339, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Float64 !0
  %410 = fadd fast double %409, %2, !dbg !277
  store double %410, double addrspace(13)* %"'ipc90.i", align 8, !dbg !277, !tbaa !143, !alias.scope !332, !noalias !344
  br label %invertL159.i

invertload37.i:                                   ; preds = %invertload44.i, %middle.block544, %invertload44.i.prol.loopexit, %load37.i
  %"'de.i.0" = phi double [ %2, %load37.i ], [ %.lcssa.unr, %invertload44.i.prol.loopexit ], [ %408, %middle.block544 ], [ %op.rdx, %invertload44.i ]
  %411 = bitcast {} addrspace(10)* addrspace(13)* %118 to <2 x double> addrspace(13)*, !dbg !283
  %412 = load <2 x double>, <2 x double> addrspace(13)* %411, align 8, !dbg !283, !tbaa !143, !alias.scope !332, !noalias !343
  %413 = insertelement <2 x double> poison, double %"'de.i.0", i64 0, !dbg !287
  %414 = shufflevector <2 x double> %413, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !287
  %415 = fadd fast <2 x double> %414, %412, !dbg !283
  store <2 x double> %415, <2 x double> addrspace(13)* %411, align 8, !dbg !283, !tbaa !143, !alias.scope !332, !noalias !344
  br label %invertL159.i

invertload44.i:                                   ; preds = %scalar.ph545, %invertload44.i
  %"'de.i.1" = phi double [ %op.rdx, %invertload44.i ], [ %bc.merge.rdx, %scalar.ph545 ]
  %storemerge11 = phi i64 [ %425, %invertload44.i ], [ %bc.resume.val550, %scalar.ph545 ]
  %416 = add nsw i64 %storemerge11, -1
  %"'ipg103_unwrap.i.3" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %118, i64 %416, !dbg !291
  %417 = bitcast {} addrspace(10)* addrspace(13)* %"'ipg103_unwrap.i.3" to <4 x double> addrspace(13)*, !dbg !291
  %418 = load <4 x double>, <4 x double> addrspace(13)* %417, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !343
  %419 = fadd fast <4 x double> %418, %.pre-phi266, !dbg !291
  store <4 x double> %419, <4 x double> addrspace(13)* %417, align 8, !dbg !291, !tbaa !143, !alias.scope !332, !noalias !344
  %420 = insertelement <4 x i64> poison, i64 %storemerge11, i64 0
  %421 = insertelement <4 x i64> %420, i64 %416, i64 1
  %422 = shufflevector <4 x i64> %421, <4 x i64> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 0>
  %423 = icmp eq <4 x i64> %422, <i64 0, i64 0, i64 2, i64 3>
  %424 = select <4 x i1> %423, <4 x double> %.pre-phi266, <4 x double> zeroinitializer
  %op.rdx = call fast double @llvm.vector.reduce.fadd.v4f64(double %"'de.i.1", <4 x double> %424)
  %425 = add nsw i64 %storemerge11, -4
  %426 = extractelement <4 x i1> %423, i64 3
  br i1 %426, label %invertload37.i, label %invertload44.i, !llvm.loop !348
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #12

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #12

; Function Attrs: noinline noreturn
define private fastcc void @julia_throw_boundserror_22262({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, [2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Integer, [-1,9]:Integer, [-1,10]:Integer, [-1,11]:Integer, [-1,12]:Integer, [-1,13]:Integer, [-1,14]:Integer, [-1,15]:Integer}" "enzymejl_parmtype"="127938116547552" "enzymejl_parmtype_ref"="1" %1) unnamed_addr #14 !dbg !349 {
top:
  %2 = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %2, i64 -14
  %3 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %2, i64 2
  %4 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %4, align 8, !tbaa !16
  %5 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %5, align 8, !tbaa !20
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #25, !dbg !350
  fence syncscope("singlethread") seq_cst
  %6 = call noalias nonnull align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %3, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938116547552 to {}*) to {} addrspace(10)*)) #26, !dbg !350
  %7 = bitcast {} addrspace(10)* %6 to i8 addrspace(10)*, !dbg !350, !enzyme_inactive !0
  %8 = bitcast [2 x i64] addrspace(11)* %1 to i8 addrspace(11)*, !dbg !350, !enzyme_inactive !0
  call void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* nocapture nofree noundef nonnull align 8 dereferenceable(16) %7, i8 addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %8, i64 noundef 16, i1 noundef false), !dbg !350, !tbaa !51, !alias.scope !351, !noalias !352, !enzyme_truetype !355
  %9 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938098633184 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %0, {} addrspace(10)* nofree nonnull %6) #27, !dbg !350
  %10 = addrspacecast {} addrspace(10)* %9 to {} addrspace(12)*, !dbg !350
  call void @ijl_throw({} addrspace(12)* %10) #28, !dbg !350
  unreachable, !dbg !350
}

; Function Attrs: noinline noreturn
define private fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer}" "enzymejl_parmtype"="127938075238032" "enzymejl_parmtype_ref"="1" %1) unnamed_addr #15 !dbg !356 {
top:
  %2 = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %2, i64 -14
  %3 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %2, i64 2
  %4 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %4, align 8, !tbaa !16
  %5 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %5, align 8, !tbaa !20
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #25, !dbg !357
  fence syncscope("singlethread") seq_cst
  %6 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %3, i64 noundef 8, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938075238032 to {}*) to {} addrspace(10)*)) #26, !dbg !357
  %7 = getelementptr inbounds [1 x i64], [1 x i64] addrspace(11)* %1, i64 0, i64 0, !dbg !357
  %8 = bitcast {} addrspace(10)* %6 to i64 addrspace(10)*, !dbg !357, !enzyme_inactive !0
  %9 = load i64, i64 addrspace(11)* %7, align 8, !dbg !357, !tbaa !20, !alias.scope !23, !noalias !26, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  store i64 %9, i64 addrspace(10)* %8, align 8, !dbg !357, !tbaa !31, !alias.scope !35, !noalias !358
  %10 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938098682144 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %0, {} addrspace(10)* nofree nonnull %6) #27, !dbg !357
  %11 = addrspacecast {} addrspace(10)* %10 to {} addrspace(12)*, !dbg !357
  call void @ijl_throw({} addrspace(12)* %11) #28, !dbg !357
  unreachable, !dbg !357
}

declare void @free(i8*) local_unnamed_addr #16

; Function Attrs: mustprogress noinline
define private fastcc void @diffejulia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %"'", i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %2, double %differeturn) unnamed_addr #17 !dbg !359 {
top:
  %3 = call {}*** @julia.get_pgcstack()
  %4 = alloca [1 x i64], align 8
  %5 = alloca [2 x i64], align 8
  %6 = alloca [1 x i64], align 8
  %7 = alloca [1 x i64], align 8
  %8 = alloca [1 x i64], align 8
  %current_task140 = getelementptr inbounds {}**, {}*** %3, i64 -14
  %9 = bitcast {}*** %current_task140 to {}*
  %ptls_field41 = getelementptr inbounds {}**, {}*** %3, i64 2
  %10 = bitcast {}*** %ptls_field41 to i64***
  %ptls_load4243 = load i64**, i64*** %10, align 8, !tbaa !16, !alias.scope !360, !noalias !363
  %11 = getelementptr inbounds i64*, i64** %ptls_load4243, i64 2
  %safepoint = load i64*, i64** %11, align 8, !tbaa !20, !alias.scope !365, !noalias !368
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #34, !dbg !370
  fence syncscope("singlethread") seq_cst
  %.not = icmp eq i64 %2, %1, !dbg !371
  br i1 %.not, label %L5, label %L22, !dbg !373

L5:                                               ; preds = %top
  %12 = add i64 %2, -1, !dbg !374
  %"'ipc" = bitcast {} addrspace(10)* %"'" to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !377
  %13 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !377
  %"'ipc7" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc" to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !377
  %14 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %13 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !377
  %15 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !377
  %16 = addrspacecast i8* addrspace(10)* %15 to i8* addrspace(11)*, !dbg !377
  %17 = bitcast {} addrspace(10)* %"'" to {} addrspace(10)** addrspace(10)*, !dbg !377
  %18 = addrspacecast {} addrspace(10)** addrspace(10)* %17 to {} addrspace(10)** addrspace(11)*, !dbg !377
  %"'ipl10105" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %18, align 8, !dbg !377, !tbaa !81, !alias.scope !379, !noalias !382, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %19 = load i8*, i8* addrspace(11)* %16, align 8, !dbg !377, !tbaa !81, !alias.scope !384, !noalias !385, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipg" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc7", i64 0, i32 1, !dbg !377
  %20 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %14, i64 0, i32 1, !dbg !377
  %"'ipl" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %"'ipg", align 8, !dbg !377, !tbaa !81, !alias.scope !379, !noalias !382, !dereferenceable_or_null !386, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %21 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %20, align 8, !dbg !377, !tbaa !81, !alias.scope !384, !noalias !385, !dereferenceable_or_null !386, !align !387, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %22 = bitcast {} addrspace(10)* %21 to i64 addrspace(10)*, !dbg !374
  %23 = addrspacecast i64 addrspace(10)* %22 to i64 addrspace(11)*, !dbg !374
  %24 = load i64, i64 addrspace(11)* %23, align 8, !dbg !374, !tbaa !104, !alias.scope !388, !noalias !391, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.not44 = icmp ult i64 %12, %24, !dbg !374
  br i1 %.not44, label %L17, label %L14, !dbg !374

L14:                                              ; preds = %L5
  %25 = getelementptr inbounds [1 x i64], [1 x i64]* %4, i64 0, i64 0, !dbg !374
  store i64 %2, i64* %25, align 8, !dbg !374, !tbaa !124, !alias.scope !126, !noalias !393
  %26 = addrspacecast [1 x i64]* %4 to [1 x i64] addrspace(11)*, !dbg !374
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %26) #32, !dbg !374
  unreachable, !dbg !374

L17:                                              ; preds = %L5
  %27 = shl nuw i64 %24, 1, !dbg !396
  %28 = add i64 %24, %12, !dbg !396
  %.not45 = icmp ult i64 %28, %27, !dbg !396
  %29 = bitcast i8* %19 to double*, !dbg !396
  %30 = getelementptr inbounds double, double* %29, i64 %12, !dbg !396
  %31 = bitcast {} addrspace(10)* %21 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !396
  %32 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %31 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !396
  %33 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %32, i64 0, i32 1, !dbg !396
  %34 = bitcast {} addrspace(10)** addrspace(11)* %33 to i8* addrspace(11)*, !dbg !396
  %35 = load i8*, i8* addrspace(11)* %34, align 8, !dbg !396, !tbaa !20, !alias.scope !397, !noalias !398, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %36 = ptrtoint i8* %35 to i64, !dbg !396
  %37 = ptrtoint double* %30 to i64, !dbg !396
  %38 = sub i64 %37, %36, !dbg !396
  %39 = shl nuw nsw i64 %24, 3, !dbg !396
  %40 = icmp ult i64 %38, %39, !dbg !396
  %41 = and i1 %.not45, %40, !dbg !396
  br i1 %41, label %invertload, label %oob, !dbg !396

L22:                                              ; preds = %top
  %42 = sub i64 %2, %1, !dbg !399
  %.not48 = icmp slt i64 %42, 1024, !dbg !402
  br i1 %.not48, label %L27, label %invertL128, !dbg !401

L27:                                              ; preds = %L22
  %43 = add i64 %1, -1, !dbg !404
  %"'ipc20" = bitcast {} addrspace(10)* %"'" to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !406
  %44 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !406
  %"'ipc21" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc20" to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !406
  %45 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %44 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !406
  %46 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !406
  %47 = addrspacecast i8* addrspace(10)* %46 to i8* addrspace(11)*, !dbg !406
  %48 = bitcast {} addrspace(10)* %"'" to {} addrspace(10)** addrspace(10)*, !dbg !406
  %49 = addrspacecast {} addrspace(10)** addrspace(10)* %48 to {} addrspace(10)** addrspace(11)*, !dbg !406
  %"'ipl26104" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %49, align 8, !dbg !406, !tbaa !81, !alias.scope !379, !noalias !382, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %50 = load i8*, i8* addrspace(11)* %47, align 8, !dbg !406, !tbaa !81, !alias.scope !384, !noalias !385, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipg22" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc21", i64 0, i32 1, !dbg !406
  %51 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %45, i64 0, i32 1, !dbg !406
  %"'ipl23" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %"'ipg22", align 8, !dbg !406, !tbaa !81, !alias.scope !379, !noalias !382, !dereferenceable_or_null !386, !invariant.group !407, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %52 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %51, align 8, !dbg !406, !tbaa !81, !alias.scope !384, !noalias !385, !dereferenceable_or_null !386, !align !387, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %53 = bitcast {} addrspace(10)* %52 to i64 addrspace(10)*, !dbg !404
  %54 = addrspacecast i64 addrspace(10)* %53 to i64 addrspace(11)*, !dbg !404
  %55 = load i64, i64 addrspace(11)* %54, align 8, !dbg !404, !tbaa !104, !alias.scope !408, !noalias !411, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.not49 = icmp ult i64 %43, %55, !dbg !404
  br i1 %.not49, label %L39, label %L36, !dbg !404

L36:                                              ; preds = %L27
  %56 = getelementptr inbounds [1 x i64], [1 x i64]* %8, i64 0, i64 0, !dbg !404
  store i64 %1, i64* %56, align 8, !dbg !404, !tbaa !124, !alias.scope !126, !noalias !393
  %57 = addrspacecast [1 x i64]* %8 to [1 x i64] addrspace(11)*, !dbg !404
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %57) #32, !dbg !404
  unreachable, !dbg !404

L39:                                              ; preds = %L27
  %58 = shl nuw i64 %55, 1, !dbg !413
  %59 = add i64 %55, %43, !dbg !413
  %.not50 = icmp ult i64 %59, %58, !dbg !413
  %60 = bitcast i8* %50 to double*, !dbg !413
  %61 = getelementptr inbounds double, double* %60, i64 %43, !dbg !413
  %62 = bitcast {} addrspace(10)* %52 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !413
  %63 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %62 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !413
  %64 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %63, i64 0, i32 1, !dbg !413
  %65 = bitcast {} addrspace(10)** addrspace(11)* %64 to i8* addrspace(11)*, !dbg !413
  %66 = load i8*, i8* addrspace(11)* %65, align 8, !dbg !413, !tbaa !20, !alias.scope !414, !noalias !415, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %67 = ptrtoint i8* %66 to i64, !dbg !413
  %68 = ptrtoint double* %61 to i64, !dbg !413
  %69 = sub i64 %68, %67, !dbg !413
  %70 = shl nuw nsw i64 %55, 3, !dbg !413
  %71 = icmp ult i64 %69, %70, !dbg !413
  %72 = and i1 %.not50, %71, !dbg !413
  br i1 %72, label %load8, label %oob4, !dbg !413

L55:                                              ; preds = %load8
  %73 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0, !dbg !416
  store i64 %101, i64* %73, align 8, !dbg !416, !tbaa !124, !alias.scope !126, !noalias !393
  %74 = addrspacecast [1 x i64]* %7 to [1 x i64] addrspace(11)*, !dbg !416
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %74) #32, !dbg !416
  unreachable, !dbg !416

L58:                                              ; preds = %load8
  %75 = add i64 %55, %1, !dbg !418
  %.not55 = icmp ult i64 %75, %58, !dbg !418
  %76 = getelementptr inbounds double, double* %60, i64 %1, !dbg !418
  %77 = ptrtoint double* %76 to i64, !dbg !418
  %78 = sub i64 %77, %67, !dbg !418
  %79 = icmp ult i64 %78, %70, !dbg !418
  %80 = and i1 %.not55, %79, !dbg !418
  br i1 %80, label %load13, label %oob9, !dbg !418

L83:                                              ; preds = %load21, %L83.lr.ph
  %iv = phi i64 [ %iv.next, %load21 ], [ 0, %L83.lr.ph ]
  %iv.next = add nuw nsw i64 %iv, 1, !dbg !419
  %81 = add i64 %iv, %105, !dbg !427
  %.not61 = icmp sle i64 %81, %spec.select
  %82 = icmp sle i64 %105, %81
  %or.cond67 = and i1 %.not61, %82, !dbg !432
  br i1 %or.cond67, label %L106, label %L99, !dbg !432

L99:                                              ; preds = %L83
  %83 = addrspacecast [2 x i64]* %5 to [2 x i64] addrspace(11)*, !dbg !434
  call fastcc void @julia_throw_boundserror_22277([2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %83, i64 signext %iv.next) #32, !dbg !434
  unreachable, !dbg !434

L106:                                             ; preds = %L83
  %exitcond.not = icmp eq i64 %iv, %111, !dbg !435
  br i1 %exitcond.not, label %L115, label %L118, !dbg !435

L115:                                             ; preds = %L106
  %84 = add i64 %55, 1, !dbg !439
  %85 = getelementptr inbounds [1 x i64], [1 x i64]* %6, i64 0, i64 0, !dbg !435
  store i64 %84, i64* %85, align 8, !dbg !435, !tbaa !124, !alias.scope !126, !noalias !393
  %86 = addrspacecast [1 x i64]* %6 to [1 x i64] addrspace(11)*, !dbg !435
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %86) #32, !dbg !435
  unreachable, !dbg !435

L118:                                             ; preds = %L106
  %87 = add i64 %81, -1, !dbg !435
  %88 = add i64 %87, %55, !dbg !440
  %.not63 = icmp ult i64 %88, %58, !dbg !440
  %89 = getelementptr inbounds double, double* %60, i64 %87, !dbg !440
  %90 = ptrtoint double* %89 to i64, !dbg !440
  %91 = sub i64 %90, %67, !dbg !440
  %92 = icmp ult i64 %91, %70, !dbg !440
  %93 = and i1 %.not63, %92, !dbg !440
  br i1 %93, label %load21, label %oob17, !dbg !440

oob:                                              ; preds = %L17
  %94 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %9, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !396
  %95 = bitcast {} addrspace(10)* %94 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !396
  %.repack = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %95, i64 0, i32 0, !dbg !396
  store i8* %19, i8* addrspace(10)* %.repack, align 8, !dbg !396, !tbaa !31, !alias.scope !35, !noalias !441
  %.repack46 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %95, i64 0, i32 1, !dbg !396
  store {} addrspace(10)* %21, {} addrspace(10)* addrspace(10)* %.repack46, align 8, !dbg !396, !tbaa !31, !alias.scope !35, !noalias !441
  %96 = addrspacecast {} addrspace(10)* %94 to {} addrspace(12)*, !dbg !396
  call void @ijl_bounds_error_int({} addrspace(12)* %96, i64 %2) #32, !dbg !396
  unreachable, !dbg !396

oob4:                                             ; preds = %L39
  %97 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %9, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !413
  %98 = bitcast {} addrspace(10)* %97 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !413
  %.repack51 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %98, i64 0, i32 0, !dbg !413
  store i8* %50, i8* addrspace(10)* %.repack51, align 8, !dbg !413, !tbaa !31, !alias.scope !35, !noalias !441
  %.repack52 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %98, i64 0, i32 1, !dbg !413
  store {} addrspace(10)* %52, {} addrspace(10)* addrspace(10)* %.repack52, align 8, !dbg !413, !tbaa !31, !alias.scope !35, !noalias !441
  %99 = addrspacecast {} addrspace(10)* %97 to {} addrspace(12)*, !dbg !413
  call void @ijl_bounds_error_int({} addrspace(12)* %99, i64 %1) #32, !dbg !413
  unreachable, !dbg !413

load8:                                            ; preds = %L39
  %100 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %"'ipl23", {} addrspace(10)** noundef %"'ipl26104"), !dbg !413
  %101 = add i64 %1, 1, !dbg !442
  %.not54 = icmp ugt i64 %55, %1, !dbg !416
  br i1 %.not54, label %L58, label %L55, !dbg !416

oob9:                                             ; preds = %L58
  %102 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %9, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !418
  %103 = bitcast {} addrspace(10)* %102 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !418
  %.repack56 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %103, i64 0, i32 0, !dbg !418
  store i8* %50, i8* addrspace(10)* %.repack56, align 8, !dbg !418, !tbaa !31, !alias.scope !35, !noalias !441
  %.repack57 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %103, i64 0, i32 1, !dbg !418
  store {} addrspace(10)* %52, {} addrspace(10)* addrspace(10)* %.repack57, align 8, !dbg !418, !tbaa !31, !alias.scope !35, !noalias !441
  %104 = addrspacecast {} addrspace(10)* %102 to {} addrspace(12)*, !dbg !418
  call void @ijl_bounds_error_int({} addrspace(12)* %104, i64 %101) #32, !dbg !418
  unreachable, !dbg !418

load13:                                           ; preds = %L58
  %105 = add i64 %1, 2, !dbg !443
  %.not59 = icmp sgt i64 %105, %2, !dbg !445
  %spec.select = select i1 %.not59, i64 %101, i64 %2, !dbg !449
  %106 = getelementptr inbounds [2 x i64], [2 x i64]* %5, i64 0, i64 0, !dbg !451
  store i64 %105, i64* %106, align 8, !dbg !451, !tbaa !124, !alias.scope !126, !noalias !393
  %107 = getelementptr inbounds [2 x i64], [2 x i64]* %5, i64 0, i64 1, !dbg !451
  store i64 %spec.select, i64* %107, align 8, !dbg !451, !tbaa !124, !alias.scope !126, !noalias !393
  %108 = sub i64 %spec.select, %105, !dbg !455
  %109 = icmp ugt i64 %108, 9223372036854775806, !dbg !461
  br i1 %109, label %invertload13, label %L83.lr.ph, !dbg !462

L83.lr.ph:                                        ; preds = %load13
  %110 = xor i64 %1, -1, !dbg !439
  %111 = add i64 %55, %110, !dbg !439
  br label %L83, !dbg !439

oob17:                                            ; preds = %L118
  %112 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %9, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !440
  %113 = bitcast {} addrspace(10)* %112 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !440
  %.repack64 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %113, i64 0, i32 0, !dbg !440
  store i8* %50, i8* addrspace(10)* %.repack64, align 8, !dbg !440, !tbaa !31, !alias.scope !35, !noalias !441
  %.repack65 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %113, i64 0, i32 1, !dbg !440
  store {} addrspace(10)* %52, {} addrspace(10)* addrspace(10)* %.repack65, align 8, !dbg !440, !tbaa !31, !alias.scope !35, !noalias !441
  %114 = addrspacecast {} addrspace(10)* %112 to {} addrspace(12)*, !dbg !440
  call void @ijl_bounds_error_int({} addrspace(12)* %114, i64 %81) #32, !dbg !440
  unreachable, !dbg !440

load21:                                           ; preds = %L118
  %exitcond89.not = icmp eq i64 %iv, %108, !dbg !463
  br i1 %exitcond89.not, label %mergeinvertL83_common.ret.loopexit, label %L83, !dbg !439, !llvm.loop !464

inverttop:                                        ; preds = %invertload13, %invertL128, %invertload
  fence syncscope("singlethread") seq_cst
  ret void

mergeinvertL83_common.ret.loopexit:               ; preds = %load21
  %115 = add i64 %spec.select, %110
  %xtraiter = and i64 %115, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %invertload21.prol.loopexit, label %invertload21.prol

invertload21.prol:                                ; preds = %mergeinvertL83_common.ret.loopexit, %invertload21.prol
  %"'de14.1.prol" = phi double [ %120, %invertload21.prol ], [ 0.000000e+00, %mergeinvertL83_common.ret.loopexit ]
  %storemerge.prol = phi i64 [ %_unwrap74.prol, %invertload21.prol ], [ %108, %mergeinvertL83_common.ret.loopexit ]
  %prol.iter = phi i64 [ %prol.iter.next, %invertload21.prol ], [ 0, %mergeinvertL83_common.ret.loopexit ]
  %_unwrap74.prol = add i64 %storemerge.prol, -1, !dbg !440
  %_unwrap75.prol = add i64 %_unwrap74.prol, %105, !dbg !440
  %"'ipg63_unwrap.prol" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %_unwrap75.prol, !dbg !440
  %"'ipc64_unwrap.prol" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg63_unwrap.prol" to double addrspace(13)*, !dbg !440
  %116 = load double, double addrspace(13)* %"'ipc64_unwrap.prol", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !468
  %117 = fadd fast double %116, %differeturn, !dbg !440
  store double %117, double addrspace(13)* %"'ipc64_unwrap.prol", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !470
  %118 = icmp eq i64 %storemerge.prol, 0
  %119 = select fast i1 %118, double %differeturn, double 0.000000e+00
  %120 = fadd fast double %119, %"'de14.1.prol"
  %prol.iter.next = add nuw nsw i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp.not, label %invertload21.prol.loopexit, label %invertload21.prol, !llvm.loop !471

invertload21.prol.loopexit:                       ; preds = %invertload21.prol, %mergeinvertL83_common.ret.loopexit
  %.lcssa.unr = phi double [ undef, %mergeinvertL83_common.ret.loopexit ], [ %120, %invertload21.prol ]
  %"'de14.1.unr" = phi double [ 0.000000e+00, %mergeinvertL83_common.ret.loopexit ], [ %120, %invertload21.prol ]
  %storemerge.unr = phi i64 [ %108, %mergeinvertL83_common.ret.loopexit ], [ %_unwrap74.prol, %invertload21.prol ]
  %121 = icmp ult i64 %108, 3
  br i1 %121, label %invertload13, label %invertload21.preheader

invertload21.preheader:                           ; preds = %invertload21.prol.loopexit
  %122 = insertelement <2 x double> poison, double %differeturn, i64 0
  %123 = shufflevector <2 x double> %122, <2 x double> poison, <2 x i32> zeroinitializer
  %124 = insertelement <4 x double> poison, double %differeturn, i64 0
  %125 = shufflevector <4 x double> %124, <4 x double> poison, <4 x i32> zeroinitializer
  br label %invertload21

invertL128:                                       ; preds = %L22
  %126 = lshr i64 %42, 1, !dbg !472
  %127 = add i64 %126, %1, !dbg !476
  %_augmented = call fastcc {} addrspace(10)* @augmented_julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %1, i64 signext %127), !dbg !477
  %128 = bitcast {} addrspace(10)* %_augmented to { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)*, !dbg !478
  %tapeld.elt = bitcast {} addrspace(10)* %_augmented to {} addrspace(10)* addrspace(10)*, !dbg !478
  %tapeld.unpack = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt, align 8, !dbg !478, !enzyme_type !230
  %tapeld.elt82 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %128, i64 0, i32 1, !dbg !478
  %tapeld.unpack83 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt82, align 8, !dbg !478, !enzyme_type !230
  %tapeld.elt84 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %128, i64 0, i32 2, !dbg !478
  %tapeld.unpack85 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt84, align 8, !dbg !478, !enzyme_type !230
  %tapeld.elt86 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %128, i64 0, i32 3, !dbg !478
  %tapeld.unpack87 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt86, align 8, !dbg !478, !enzyme_type !230
  %_unwrap33 = add i64 %127, 1, !dbg !479
  call fastcc void @diffejulia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %_unwrap33, i64 signext %2, double %differeturn), !dbg !479
  %129 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } poison, {} addrspace(10)* %tapeld.unpack, 0, !dbg !478
  %130 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %129, {} addrspace(10)* %tapeld.unpack83, 1, !dbg !478
  %131 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %130, {} addrspace(10)* %tapeld.unpack85, 2, !dbg !478
  %132 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %131, {} addrspace(10)* %tapeld.unpack87, 3, !dbg !478
  call fastcc void @diffejulia_mapreduce_impl_22268.5({} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %1, i64 signext %127, double %differeturn, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %132), !dbg !477
  br label %inverttop

invertload:                                       ; preds = %L17
  %133 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %"'ipl", {} addrspace(10)** noundef %"'ipl10105"), !dbg !396
  %"'ipg35_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %133, i64 %12, !dbg !396
  %"'ipc36_unwrap" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg35_unwrap" to double addrspace(13)*, !dbg !396
  %134 = load double, double addrspace(13)* %"'ipc36_unwrap", align 8, !dbg !396, !tbaa !143, !alias.scope !480, !noalias !483
  %135 = fadd fast double %134, %differeturn, !dbg !396
  store double %135, double addrspace(13)* %"'ipc36_unwrap", align 8, !dbg !396, !tbaa !143, !alias.scope !480, !noalias !485
  br label %inverttop

invertload13:                                     ; preds = %invertload21, %invertload21.prol.loopexit, %load13
  %"'de14.0" = phi double [ %differeturn, %load13 ], [ %.lcssa.unr, %invertload21.prol.loopexit ], [ %op.rdx, %invertload21 ]
  %"'ipg45_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %43, !dbg !413
  %136 = bitcast {} addrspace(10)* addrspace(13)* %"'ipg45_unwrap" to <2 x double> addrspace(13)*, !dbg !413
  %137 = load <2 x double>, <2 x double> addrspace(13)* %136, align 8, !dbg !413, !tbaa !143, !alias.scope !465, !noalias !468
  %138 = insertelement <2 x double> poison, double %"'de14.0", i64 0, !dbg !418
  %139 = shufflevector <2 x double> %138, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !418
  %140 = fadd fast <2 x double> %139, %137, !dbg !413
  store <2 x double> %140, <2 x double> addrspace(13)* %136, align 8, !dbg !413, !tbaa !143, !alias.scope !465, !noalias !470
  br label %inverttop

invertload21:                                     ; preds = %invertload21.preheader, %invertload21
  %"'de14.1" = phi double [ %op.rdx, %invertload21 ], [ %"'de14.1.unr", %invertload21.preheader ]
  %storemerge = phi i64 [ %_unwrap74.3, %invertload21 ], [ %storemerge.unr, %invertload21.preheader ]
  %_unwrap74 = add i64 %storemerge, -1, !dbg !440
  %_unwrap75 = add i64 %_unwrap74, %105, !dbg !440
  %"'ipg63_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %_unwrap75, !dbg !440
  %"'ipc64_unwrap" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg63_unwrap" to double addrspace(13)*, !dbg !440
  %141 = load double, double addrspace(13)* %"'ipc64_unwrap", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !468
  %142 = fadd fast double %141, %differeturn, !dbg !440
  store double %142, double addrspace(13)* %"'ipc64_unwrap", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !470
  %_unwrap75.1 = add i64 %storemerge, %1, !dbg !440
  %"'ipg63_unwrap.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %_unwrap75.1, !dbg !440
  %"'ipc64_unwrap.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg63_unwrap.1" to double addrspace(13)*, !dbg !440
  %143 = load double, double addrspace(13)* %"'ipc64_unwrap.1", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !468
  %144 = fadd fast double %143, %differeturn, !dbg !440
  store double %144, double addrspace(13)* %"'ipc64_unwrap.1", align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !470
  %_unwrap74.2 = add i64 %storemerge, -3, !dbg !440
  %_unwrap74.3 = add i64 %storemerge, -4, !dbg !440
  %_unwrap75.3 = add i64 %_unwrap74.3, %105, !dbg !440
  %"'ipg63_unwrap.3" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %100, i64 %_unwrap75.3, !dbg !440
  %145 = bitcast {} addrspace(10)* addrspace(13)* %"'ipg63_unwrap.3" to <2 x double> addrspace(13)*, !dbg !440
  %146 = load <2 x double>, <2 x double> addrspace(13)* %145, align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !468
  %147 = fadd fast <2 x double> %146, %123, !dbg !440
  store <2 x double> %147, <2 x double> addrspace(13)* %145, align 8, !dbg !440, !tbaa !143, !alias.scope !465, !noalias !470
  %148 = insertelement <4 x i64> poison, i64 %storemerge, i64 0
  %149 = insertelement <4 x i64> %148, i64 %_unwrap74, i64 1
  %150 = insertelement <4 x i64> %149, i64 %_unwrap74.2, i64 3
  %151 = shufflevector <4 x i64> %150, <4 x i64> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 3>
  %152 = icmp eq <4 x i64> %151, <i64 0, i64 0, i64 2, i64 0>
  %153 = select <4 x i1> %152, <4 x double> %125, <4 x double> zeroinitializer
  %op.rdx = call fast double @llvm.vector.reduce.fadd.v4f64(double %"'de14.1", <4 x double> %153)
  %154 = extractelement <4 x i1> %152, i64 3
  br i1 %154, label %invertload13, label %invertload21
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.vector.reduce.fadd.v4f64(double, <4 x double>) #18

; Function Attrs: noinline noreturn
define private fastcc void @julia_throw_boundserror_22277([2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,0]:Integer, [-1,1]:Integer, [-1,2]:Integer, [-1,3]:Integer, [-1,4]:Integer, [-1,5]:Integer, [-1,6]:Integer, [-1,7]:Integer, [-1,8]:Integer, [-1,9]:Integer, [-1,10]:Integer, [-1,11]:Integer, [-1,12]:Integer, [-1,13]:Integer, [-1,14]:Integer, [-1,15]:Integer}" "enzymejl_parmtype"="127938118972368" "enzymejl_parmtype_ref"="1" %0, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1) unnamed_addr #19 !dbg !486 {
top:
  %2 = call {}*** @julia.get_pgcstack()
  %current_task13 = getelementptr inbounds {}**, {}*** %2, i64 -14
  %3 = bitcast {}*** %current_task13 to {}*
  %ptls_field4 = getelementptr inbounds {}**, {}*** %2, i64 2
  %4 = bitcast {}*** %ptls_field4 to i64***
  %ptls_load56 = load i64**, i64*** %4, align 8, !tbaa !16
  %5 = getelementptr inbounds i64*, i64** %ptls_load56, i64 2
  %safepoint = load i64*, i64** %5, align 8, !tbaa !20
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #25, !dbg !487
  fence syncscope("singlethread") seq_cst
  %6 = call noalias nonnull align 8 dereferenceable(16) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %3, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938118972368 to {}*) to {} addrspace(10)*)) #26, !dbg !487
  %7 = bitcast {} addrspace(10)* %6 to i8 addrspace(10)*, !dbg !487, !enzyme_inactive !0
  %8 = bitcast [2 x i64] addrspace(11)* %0 to i8 addrspace(11)*, !dbg !487, !enzyme_inactive !0
  call void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* nocapture nofree noundef nonnull align 8 dereferenceable(16) %7, i8 addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %8, i64 noundef 16, i1 noundef false), !dbg !487, !tbaa !51, !alias.scope !351, !noalias !352, !enzyme_truetype !355
  %9 = call noalias nonnull align 8 dereferenceable(8) "enzyme_inactive" "enzyme_type"="{[-1]:Pointer, [-1,-1]:Integer}" {} addrspace(10)* @ijl_box_int64(i64 signext %1) #35, !dbg !487
  %10 = call nonnull "enzyme_type"="{[-1]:Pointer}" {} addrspace(10)* ({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)*, {} addrspace(10)*, {} addrspace(10)*, ...) @julia.call2({} addrspace(10)* ({} addrspace(10)*, {} addrspace(10)**, i32, {} addrspace(10)*)* noundef nonnull @ijl_invoke, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938115566832 to {}*) to {} addrspace(10)*), {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938130657168 to {}*) to {} addrspace(10)*), {} addrspace(10)* nofree nonnull %6, {} addrspace(10)* nonnull %9) #27, !dbg !487
  %11 = addrspacecast {} addrspace(10)* %10 to {} addrspace(12)*, !dbg !487
  call void @ijl_throw({} addrspace(12)* %11) #28, !dbg !487
  unreachable, !dbg !487
}

; Function Attrs: mustprogress noinline
define private fastcc nonnull align 8 dereferenceable(32) {} addrspace(10)* @augmented_julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %"'", i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %2) unnamed_addr #17 !dbg !488 {
top:
  %3 = call {}*** @julia.get_pgcstack()
  %4 = getelementptr inbounds {}**, {}*** %3, i64 -14
  %5 = bitcast {}*** %4 to {}*
  %6 = call noalias nonnull align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 32, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127936723588816 to {}*) to {} addrspace(10)*)) #36
  %7 = bitcast {} addrspace(10)* %6 to { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)*
  %8 = getelementptr { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %7, i64 0, i32 1
  %9 = getelementptr { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %7, i64 0, i32 2
  %10 = getelementptr { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %7, i64 0, i32 3
  %11 = bitcast {} addrspace(10)* %6 to <4 x {} addrspace(10)*> addrspace(10)*
  store <4 x {} addrspace(10)*> <{} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)* @ejl_jl_nothing, {} addrspace(10)* @ejl_jl_nothing>, <4 x {} addrspace(10)*> addrspace(10)* %11, align 8, !noalias !223
  %12 = alloca [1 x i64], align 8
  %13 = alloca [1 x i64], align 8
  %14 = alloca [1 x i64], align 8
  %15 = alloca [2 x i64], align 8
  %16 = alloca [1 x i64], align 8
  %ptls_field41 = getelementptr inbounds {}**, {}*** %3, i64 2
  %17 = bitcast {}*** %ptls_field41 to i64***
  %ptls_load4243 = load i64**, i64*** %17, align 8, !tbaa !16, !alias.scope !489, !noalias !492
  %18 = getelementptr inbounds i64*, i64** %ptls_load4243, i64 2
  %safepoint = load i64*, i64** %18, align 8, !tbaa !20, !alias.scope !494, !noalias !497
  fence syncscope("singlethread") seq_cst
  call void @julia.safepoint(i64* %safepoint) #34, !dbg !499
  fence syncscope("singlethread") seq_cst
  %.not = icmp eq i64 %2, %1, !dbg !500
  br i1 %.not, label %L5, label %L22, !dbg !501

L5:                                               ; preds = %top
  %19 = getelementptr { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %7, i64 0, i32 0
  %20 = add i64 %2, -1, !dbg !502
  %"'ipc" = bitcast {} addrspace(10)* %"'" to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !504
  %21 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !504
  %"'ipc7" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc" to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !504
  %22 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %21 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !504
  %23 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !504
  %24 = addrspacecast i8* addrspace(10)* %23 to i8* addrspace(11)*, !dbg !504
  %25 = load i8*, i8* addrspace(11)* %24, align 8, !dbg !504, !tbaa !81, !alias.scope !505, !noalias !508, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipg" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc7", i64 0, i32 1, !dbg !504
  %26 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %22, i64 0, i32 1, !dbg !504
  %"'ipl" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %"'ipg", align 8, !dbg !504, !tbaa !81, !alias.scope !510, !noalias !511, !dereferenceable_or_null !386, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  store {} addrspace(10)* %"'ipl", {} addrspace(10)* addrspace(10)* %19, align 8, !dbg !504, !noalias !223
  call void ({} addrspace(10)*, ...) @julia.write_barrier({} addrspace(10)* nofree noundef nonnull %6, {} addrspace(10)* %"'ipl"), !dbg !504
  %27 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %26, align 8, !dbg !504, !tbaa !81, !alias.scope !505, !noalias !508, !dereferenceable_or_null !386, !align !387, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %28 = bitcast {} addrspace(10)* %27 to i64 addrspace(10)*, !dbg !502
  %29 = addrspacecast i64 addrspace(10)* %28 to i64 addrspace(11)*, !dbg !502
  %30 = load i64, i64 addrspace(11)* %29, align 8, !dbg !502, !tbaa !104, !alias.scope !512, !noalias !515, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.not44 = icmp ult i64 %20, %30, !dbg !502
  br i1 %.not44, label %L17, label %L14, !dbg !502

L14:                                              ; preds = %L5
  %31 = getelementptr inbounds [1 x i64], [1 x i64]* %13, i64 0, i64 0, !dbg !502
  store i64 %2, i64* %31, align 8, !dbg !502, !tbaa !124, !alias.scope !126, !noalias !517
  %32 = addrspacecast [1 x i64]* %13 to [1 x i64] addrspace(11)*, !dbg !502
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %32) #32, !dbg !502
  unreachable, !dbg !502

L17:                                              ; preds = %L5
  %33 = shl nuw i64 %30, 1, !dbg !520
  %34 = add i64 %30, %20, !dbg !520
  %.not45 = icmp ult i64 %34, %33, !dbg !520
  %35 = bitcast i8* %25 to double*, !dbg !520
  %36 = getelementptr inbounds double, double* %35, i64 %20, !dbg !520
  %37 = bitcast {} addrspace(10)* %27 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !520
  %38 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %37 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !520
  %39 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %38, i64 0, i32 1, !dbg !520
  %40 = bitcast {} addrspace(10)** addrspace(11)* %39 to i8* addrspace(11)*, !dbg !520
  %41 = load i8*, i8* addrspace(11)* %40, align 8, !dbg !520, !tbaa !20, !alias.scope !521, !noalias !522, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %42 = ptrtoint i8* %41 to i64, !dbg !520
  %43 = ptrtoint double* %36 to i64, !dbg !520
  %44 = sub i64 %43, %42, !dbg !520
  %45 = shl nuw nsw i64 %30, 3, !dbg !520
  %46 = icmp ult i64 %44, %45, !dbg !520
  %47 = and i1 %.not45, %46, !dbg !520
  br i1 %47, label %common.ret, label %oob, !dbg !520

common.ret:                                       ; preds = %load21, %L17, %load13, %L128
  ret {} addrspace(10)* %6, !dbg !523

L22:                                              ; preds = %top
  %48 = sub i64 %2, %1, !dbg !524
  %.not48 = icmp slt i64 %48, 1024, !dbg !526
  br i1 %.not48, label %L27, label %L128, !dbg !525

L27:                                              ; preds = %L22
  %49 = add i64 %1, -1, !dbg !527
  %"'ipc11" = bitcast {} addrspace(10)* %"'" to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !529
  %50 = bitcast {} addrspace(10)* %0 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !529
  %"'ipc12" = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %"'ipc11" to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !529
  %51 = addrspacecast { i8*, {} addrspace(10)* } addrspace(10)* %50 to { i8*, {} addrspace(10)* } addrspace(11)*, !dbg !529
  %52 = bitcast {} addrspace(10)* %0 to i8* addrspace(10)*, !dbg !529
  %53 = addrspacecast i8* addrspace(10)* %52 to i8* addrspace(11)*, !dbg !529
  %54 = load i8*, i8* addrspace(11)* %53, align 8, !dbg !529, !tbaa !81, !alias.scope !505, !noalias !508, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'ipg13" = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %"'ipc12", i64 0, i32 1, !dbg !529
  %55 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(11)* %51, i64 0, i32 1, !dbg !529
  %"'ipl14" = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %"'ipg13", align 8, !dbg !529, !tbaa !81, !alias.scope !510, !noalias !511, !dereferenceable_or_null !386, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  store {} addrspace(10)* %"'ipl14", {} addrspace(10)* addrspace(10)* %8, align 8, !dbg !529, !noalias !223
  call void ({} addrspace(10)*, ...) @julia.write_barrier({} addrspace(10)* nofree noundef nonnull %6, {} addrspace(10)* %"'ipl14"), !dbg !529
  %56 = load {} addrspace(10)*, {} addrspace(10)* addrspace(11)* %55, align 8, !dbg !529, !tbaa !81, !alias.scope !505, !noalias !508, !dereferenceable_or_null !386, !align !387, !enzyme_type !71, !enzymejl_source_type_Memory\7BFloat64\7D !0, !enzymejl_byref_MUT_REF !0
  %57 = bitcast {} addrspace(10)* %56 to i64 addrspace(10)*, !dbg !527
  %58 = addrspacecast i64 addrspace(10)* %57 to i64 addrspace(11)*, !dbg !527
  %59 = load i64, i64 addrspace(11)* %58, align 8, !dbg !527, !tbaa !104, !alias.scope !530, !noalias !533, !enzyme_inactive !0, !enzyme_type !54, !enzymejl_source_type_Int64 !0, !enzymejl_byref_BITS_VALUE !0
  %.not49 = icmp ult i64 %49, %59, !dbg !527
  br i1 %.not49, label %L39, label %L36, !dbg !527

L36:                                              ; preds = %L27
  %60 = getelementptr inbounds [1 x i64], [1 x i64]* %12, i64 0, i64 0, !dbg !527
  store i64 %1, i64* %60, align 8, !dbg !527, !tbaa !124, !alias.scope !126, !noalias !517
  %61 = addrspacecast [1 x i64]* %12 to [1 x i64] addrspace(11)*, !dbg !527
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %61) #32, !dbg !527
  unreachable, !dbg !527

L39:                                              ; preds = %L27
  %62 = shl nuw i64 %59, 1, !dbg !535
  %63 = add i64 %59, %49, !dbg !535
  %.not50 = icmp ult i64 %63, %62, !dbg !535
  %64 = bitcast i8* %54 to double*, !dbg !535
  %65 = getelementptr inbounds double, double* %64, i64 %49, !dbg !535
  %66 = bitcast {} addrspace(10)* %56 to { i64, {} addrspace(10)** } addrspace(10)*, !dbg !535
  %67 = addrspacecast { i64, {} addrspace(10)** } addrspace(10)* %66 to { i64, {} addrspace(10)** } addrspace(11)*, !dbg !535
  %68 = getelementptr inbounds { i64, {} addrspace(10)** }, { i64, {} addrspace(10)** } addrspace(11)* %67, i64 0, i32 1, !dbg !535
  %69 = bitcast {} addrspace(10)** addrspace(11)* %68 to i8* addrspace(11)*, !dbg !535
  %70 = load i8*, i8* addrspace(11)* %69, align 8, !dbg !535, !tbaa !20, !alias.scope !536, !noalias !537, !nonnull !0, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0
  %71 = ptrtoint i8* %70 to i64, !dbg !535
  %72 = ptrtoint double* %65 to i64, !dbg !535
  %73 = sub i64 %72, %71, !dbg !535
  %74 = shl nuw nsw i64 %59, 3, !dbg !535
  %75 = icmp ult i64 %73, %74, !dbg !535
  %76 = and i1 %.not50, %75, !dbg !535
  br i1 %76, label %load8, label %oob4, !dbg !535

L55:                                              ; preds = %load8
  %77 = getelementptr inbounds [1 x i64], [1 x i64]* %14, i64 0, i64 0, !dbg !538
  store i64 %107, i64* %77, align 8, !dbg !538, !tbaa !124, !alias.scope !126, !noalias !517
  %78 = addrspacecast [1 x i64]* %14 to [1 x i64] addrspace(11)*, !dbg !538
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %78) #32, !dbg !538
  unreachable, !dbg !538

L58:                                              ; preds = %load8
  %79 = add i64 %59, %1, !dbg !540
  %.not55 = icmp ult i64 %79, %62, !dbg !540
  %80 = getelementptr inbounds double, double* %64, i64 %1, !dbg !540
  %81 = ptrtoint double* %80 to i64, !dbg !540
  %82 = sub i64 %81, %71, !dbg !540
  %83 = icmp ult i64 %82, %74, !dbg !540
  %84 = and i1 %.not55, %83, !dbg !540
  br i1 %84, label %load13, label %oob9, !dbg !540

L83:                                              ; preds = %load21, %L83.lr.ph
  %iv = phi i64 [ %iv.next, %load21 ], [ 0, %L83.lr.ph ]
  %iv.next = add nuw nsw i64 %iv, 1, !dbg !541
  %85 = add i64 %iv, %111, !dbg !545
  %.not61 = icmp sle i64 %85, %spec.select
  %86 = icmp sle i64 %111, %85
  %or.cond67 = and i1 %.not61, %86, !dbg !548
  br i1 %or.cond67, label %L106, label %L99, !dbg !548

L99:                                              ; preds = %L83
  %87 = addrspacecast [2 x i64]* %15 to [2 x i64] addrspace(11)*, !dbg !549
  call fastcc void @julia_throw_boundserror_22277([2 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(16) %87, i64 signext %iv.next) #32, !dbg !549
  unreachable, !dbg !549

L106:                                             ; preds = %L83
  %exitcond.not = icmp eq i64 %iv, %117, !dbg !550
  br i1 %exitcond.not, label %L115, label %L118, !dbg !550

L115:                                             ; preds = %L106
  %88 = add i64 %59, 1, !dbg !553
  %89 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0, !dbg !550
  store i64 %88, i64* %89, align 8, !dbg !550, !tbaa !124, !alias.scope !126, !noalias !517
  %90 = addrspacecast [1 x i64]* %16 to [1 x i64] addrspace(11)*, !dbg !550
  call fastcc void @julia_throw_boundserror_22281({} addrspace(10)* nofree noundef nonnull align 8 dereferenceable(32) %0, [1 x i64] addrspace(11)* nocapture nofree noundef nonnull readonly align 8 dereferenceable(8) %90) #32, !dbg !550
  unreachable, !dbg !550

L118:                                             ; preds = %L106
  %91 = add i64 %85, -1, !dbg !550
  %92 = add i64 %91, %59, !dbg !554
  %.not63 = icmp ult i64 %92, %62, !dbg !554
  %93 = getelementptr inbounds double, double* %64, i64 %91, !dbg !554
  %94 = ptrtoint double* %93 to i64, !dbg !554
  %95 = sub i64 %94, %71, !dbg !554
  %96 = icmp ult i64 %95, %74, !dbg !554
  %97 = and i1 %.not63, %96, !dbg !554
  br i1 %97, label %load21, label %oob17, !dbg !554

L128:                                             ; preds = %L22
  %98 = lshr i64 %48, 1, !dbg !555
  %99 = add i64 %98, %1, !dbg !558
  %_augmented18 = call fastcc {} addrspace(10)* @augmented_julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %1, i64 signext %99), !dbg !559
  store {} addrspace(10)* %_augmented18, {} addrspace(10)* addrspace(10)* %10, align 8, !dbg !560, !noalias !223
  call void ({} addrspace(10)*, ...) @julia.write_barrier({} addrspace(10)* nofree noundef nonnull %6, {} addrspace(10)* nonnull %_augmented18), !dbg !560
  %100 = add i64 %99, 1, !dbg !560
  %_augmented = call fastcc {} addrspace(10)* @augmented_julia_mapreduce_impl_22268({} addrspace(10)* noundef nonnull align 8 dereferenceable(32) %0, {} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %100, i64 signext %2), !dbg !561
  store {} addrspace(10)* %_augmented, {} addrspace(10)* addrspace(10)* %9, align 8, !noalias !223
  call void ({} addrspace(10)*, ...) @julia.write_barrier({} addrspace(10)* nofree noundef nonnull %6, {} addrspace(10)* nonnull %_augmented)
  br label %common.ret

oob:                                              ; preds = %L17
  %101 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !520
  %102 = bitcast {} addrspace(10)* %101 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !520
  %.repack = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %102, i64 0, i32 0, !dbg !520
  store i8* %25, i8* addrspace(10)* %.repack, align 8, !dbg !520, !tbaa !31, !alias.scope !35, !noalias !562
  %.repack46 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %102, i64 0, i32 1, !dbg !520
  store {} addrspace(10)* %27, {} addrspace(10)* addrspace(10)* %.repack46, align 8, !dbg !520, !tbaa !31, !alias.scope !35, !noalias !562
  %103 = addrspacecast {} addrspace(10)* %101 to {} addrspace(12)*, !dbg !520
  call void @ijl_bounds_error_int({} addrspace(12)* %103, i64 %2) #32, !dbg !520
  unreachable, !dbg !520

oob4:                                             ; preds = %L39
  %104 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !535
  %105 = bitcast {} addrspace(10)* %104 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !535
  %.repack51 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %105, i64 0, i32 0, !dbg !535
  store i8* %54, i8* addrspace(10)* %.repack51, align 8, !dbg !535, !tbaa !31, !alias.scope !35, !noalias !562
  %.repack52 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %105, i64 0, i32 1, !dbg !535
  store {} addrspace(10)* %56, {} addrspace(10)* addrspace(10)* %.repack52, align 8, !dbg !535, !tbaa !31, !alias.scope !35, !noalias !562
  %106 = addrspacecast {} addrspace(10)* %104 to {} addrspace(12)*, !dbg !535
  call void @ijl_bounds_error_int({} addrspace(12)* %106, i64 %1) #32, !dbg !535
  unreachable, !dbg !535

load8:                                            ; preds = %L39
  %107 = add i64 %1, 1, !dbg !563
  %.not54 = icmp ugt i64 %59, %1, !dbg !538
  br i1 %.not54, label %L58, label %L55, !dbg !538

oob9:                                             ; preds = %L58
  %108 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !540
  %109 = bitcast {} addrspace(10)* %108 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !540
  %.repack56 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %109, i64 0, i32 0, !dbg !540
  store i8* %54, i8* addrspace(10)* %.repack56, align 8, !dbg !540, !tbaa !31, !alias.scope !35, !noalias !562
  %.repack57 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %109, i64 0, i32 1, !dbg !540
  store {} addrspace(10)* %56, {} addrspace(10)* addrspace(10)* %.repack57, align 8, !dbg !540, !tbaa !31, !alias.scope !35, !noalias !562
  %110 = addrspacecast {} addrspace(10)* %108 to {} addrspace(12)*, !dbg !540
  call void @ijl_bounds_error_int({} addrspace(12)* %110, i64 %107) #32, !dbg !540
  unreachable, !dbg !540

load13:                                           ; preds = %L58
  %111 = add i64 %1, 2, !dbg !564
  %.not59 = icmp sgt i64 %111, %2, !dbg !566
  %spec.select = select i1 %.not59, i64 %107, i64 %2, !dbg !568
  %112 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 0, !dbg !569
  store i64 %111, i64* %112, align 8, !dbg !569, !tbaa !124, !alias.scope !126, !noalias !517
  %113 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 1, !dbg !569
  store i64 %spec.select, i64* %113, align 8, !dbg !569, !tbaa !124, !alias.scope !126, !noalias !517
  %114 = sub i64 %spec.select, %111, !dbg !571
  %115 = icmp ugt i64 %114, 9223372036854775806, !dbg !575
  br i1 %115, label %common.ret, label %L83.lr.ph, !dbg !576

L83.lr.ph:                                        ; preds = %load13
  %116 = xor i64 %1, -1, !dbg !553
  %117 = add i64 %59, %116, !dbg !553
  br label %L83, !dbg !553

oob17:                                            ; preds = %L118
  %118 = call noalias nonnull align 8 dereferenceable(16) "enzyme_type"="{[-1]:Pointer, [-1,-1]:Pointer, [-1,0,-1]:Float@double, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double}" {} addrspace(10)* @julia.gc_alloc_obj({}* nonnull %5, i64 noundef 16, {} addrspace(10)* noundef addrspacecast ({}* inttoptr (i64 127938077109920 to {}*) to {} addrspace(10)*)) #31, !dbg !554
  %119 = bitcast {} addrspace(10)* %118 to { i8*, {} addrspace(10)* } addrspace(10)*, !dbg !554
  %.repack64 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %119, i64 0, i32 0, !dbg !554
  store i8* %54, i8* addrspace(10)* %.repack64, align 8, !dbg !554, !tbaa !31, !alias.scope !35, !noalias !562
  %.repack65 = getelementptr inbounds { i8*, {} addrspace(10)* }, { i8*, {} addrspace(10)* } addrspace(10)* %119, i64 0, i32 1, !dbg !554
  store {} addrspace(10)* %56, {} addrspace(10)* addrspace(10)* %.repack65, align 8, !dbg !554, !tbaa !31, !alias.scope !35, !noalias !562
  %120 = addrspacecast {} addrspace(10)* %118 to {} addrspace(12)*, !dbg !554
  call void @ijl_bounds_error_int({} addrspace(12)* %120, i64 %85) #32, !dbg !554
  unreachable, !dbg !554

load21:                                           ; preds = %L118
  %exitcond89.not = icmp eq i64 %iv, %114, !dbg !577
  br i1 %exitcond89.not, label %common.ret, label %L83, !dbg !553, !llvm.loop !578
}

; Function Attrs: mustprogress noinline
define private fastcc void @diffejulia_mapreduce_impl_22268.5({} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) "enzyme_type"="{[-1]:Pointer, [-1,0]:Pointer, [-1,0,-1]:Float@double, [-1,8]:Pointer, [-1,8,0]:Integer, [-1,8,1]:Integer, [-1,8,2]:Integer, [-1,8,3]:Integer, [-1,8,4]:Integer, [-1,8,5]:Integer, [-1,8,6]:Integer, [-1,8,7]:Integer, [-1,8,8]:Pointer, [-1,8,8,-1]:Float@double, [-1,16]:Integer, [-1,17]:Integer, [-1,18]:Integer, [-1,19]:Integer, [-1,20]:Integer, [-1,21]:Integer, [-1,22]:Integer, [-1,23]:Integer, [-1,24]:Integer, [-1,25]:Integer, [-1,26]:Integer, [-1,27]:Integer, [-1,28]:Integer, [-1,29]:Integer, [-1,30]:Integer, [-1,31]:Integer}" "enzymejl_parmtype"="127938216542032" "enzymejl_parmtype_ref"="2" %"'", i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %0, i64 signext "enzyme_inactive" "enzyme_type"="{[-1]:Integer}" "enzymejl_parmtype"="127938131216640" "enzymejl_parmtype_ref"="0" %1, double %differeturn, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %tapeArg) unnamed_addr #20 !dbg !579 {
top:
  %2 = call {}*** @julia.get_pgcstack()
  %.not = icmp eq i64 %1, %0, !dbg !580
  br i1 %.not, label %invertload, label %L22, !dbg !581

L22:                                              ; preds = %top
  %3 = sub i64 %1, %0, !dbg !582
  %.not48 = icmp slt i64 %3, 1024, !dbg !584
  br i1 %.not48, label %L27, label %invertL128, !dbg !583

L27:                                              ; preds = %L22
  %4 = bitcast {} addrspace(10)* %"'" to {} addrspace(10)** addrspace(10)*, !dbg !585
  %5 = addrspacecast {} addrspace(10)** addrspace(10)* %4 to {} addrspace(10)** addrspace(11)*, !dbg !585
  %"'ipl6351" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %5, align 8, !dbg !585, !tbaa !81, !alias.scope !588, !noalias !591, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'il_phi4" = extractvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %tapeArg, 1, !dbg !585, !enzyme_type !230
  %6 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %"'il_phi4", {} addrspace(10)** noundef %"'ipl6351"), !dbg !593
  %7 = add i64 %0, 1, !dbg !594
  %8 = add i64 %0, 2, !dbg !596
  %.not59 = icmp sgt i64 %8, %1, !dbg !599
  %spec.select = select i1 %.not59, i64 %7, i64 %1, !dbg !601
  %9 = sub i64 %spec.select, %8, !dbg !604
  %10 = icmp ugt i64 %9, 9223372036854775806, !dbg !608
  br i1 %10, label %invertload13, label %L83.preheader, !dbg !609

L83.preheader:                                    ; preds = %L27
  %11 = xor i64 %0, -1
  %12 = add i64 %spec.select, %11
  %xtraiter = and i64 %12, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %invertload21.prol.loopexit, label %invertload21.prol

inverttop:                                        ; preds = %invertload13, %invertL128, %invertload
  fence syncscope("singlethread") seq_cst
  ret void

invertload21.prol:                                ; preds = %L83.preheader, %invertload21.prol
  %"'de50.1.prol" = phi double [ %17, %invertload21.prol ], [ 0.000000e+00, %L83.preheader ]
  %storemerge.prol = phi i64 [ %_unwrap169.prol, %invertload21.prol ], [ %9, %L83.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %invertload21.prol ], [ 0, %L83.preheader ]
  %_unwrap169.prol = add i64 %storemerge.prol, -1, !dbg !610
  %_unwrap170.prol = add i64 %_unwrap169.prol, %8, !dbg !610
  %"'ipg161_unwrap.prol" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %6, i64 %_unwrap170.prol, !dbg !610
  %"'ipc162_unwrap.prol" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg161_unwrap.prol" to double addrspace(13)*, !dbg !610
  %13 = load double, double addrspace(13)* %"'ipc162_unwrap.prol", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !616
  %14 = fadd fast double %13, %differeturn, !dbg !610
  store double %14, double addrspace(13)* %"'ipc162_unwrap.prol", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !618
  %15 = icmp eq i64 %storemerge.prol, 0
  %16 = select fast i1 %15, double %differeturn, double 0.000000e+00
  %17 = fadd fast double %16, %"'de50.1.prol"
  %prol.iter.next = add nuw nsw i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp.not, label %invertload21.prol.loopexit, label %invertload21.prol, !llvm.loop !621

invertload21.prol.loopexit:                       ; preds = %invertload21.prol, %L83.preheader
  %.lcssa.unr = phi double [ undef, %L83.preheader ], [ %17, %invertload21.prol ]
  %"'de50.1.unr" = phi double [ 0.000000e+00, %L83.preheader ], [ %17, %invertload21.prol ]
  %storemerge.unr = phi i64 [ %9, %L83.preheader ], [ %_unwrap169.prol, %invertload21.prol ]
  %18 = icmp ult i64 %9, 3
  br i1 %18, label %invertload13, label %invertload21.preheader

invertload21.preheader:                           ; preds = %invertload21.prol.loopexit
  %19 = insertelement <2 x double> poison, double %differeturn, i64 0
  %20 = shufflevector <2 x double> %19, <2 x double> poison, <2 x i32> zeroinitializer
  %21 = insertelement <4 x double> poison, double %differeturn, i64 0
  %22 = shufflevector <4 x double> %21, <4 x double> poison, <4 x i32> zeroinitializer
  br label %invertload21

invertL128:                                       ; preds = %L22
  %tapeArg115 = extractvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %tapeArg, 3, !dbg !622, !enzyme_type !230
  %23 = bitcast {} addrspace(10)* %tapeArg115 to { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)*, !dbg !623
  %tapeld117.elt = bitcast {} addrspace(10)* %tapeArg115 to {} addrspace(10)* addrspace(10)*, !dbg !623
  %tapeld117.unpack = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld117.elt, align 8, !dbg !623, !enzyme_type !230
  %tapeld117.elt7 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %23, i64 0, i32 1, !dbg !623
  %tapeld117.unpack8 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld117.elt7, align 8, !dbg !623, !enzyme_type !230
  %tapeld117.elt9 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %23, i64 0, i32 2, !dbg !623
  %tapeld117.unpack10 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld117.elt9, align 8, !dbg !623, !enzyme_type !230
  %tapeld117.elt11 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %23, i64 0, i32 3, !dbg !623
  %tapeld117.unpack12 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld117.elt11, align 8, !dbg !623, !enzyme_type !230
  %tapeArg113 = extractvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %tapeArg, 2, !dbg !624, !enzyme_type !230
  %24 = bitcast {} addrspace(10)* %tapeArg113 to { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)*, !dbg !625
  %tapeld.elt = bitcast {} addrspace(10)* %tapeArg113 to {} addrspace(10)* addrspace(10)*, !dbg !625
  %tapeld.unpack = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt, align 8, !dbg !625, !enzyme_type !230
  %tapeld.elt14 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %24, i64 0, i32 1, !dbg !625
  %tapeld.unpack15 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt14, align 8, !dbg !625, !enzyme_type !230
  %tapeld.elt16 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %24, i64 0, i32 2, !dbg !625
  %tapeld.unpack17 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt16, align 8, !dbg !625, !enzyme_type !230
  %tapeld.elt18 = getelementptr inbounds { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* }, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } addrspace(10)* %24, i64 0, i32 3, !dbg !625
  %tapeld.unpack19 = load {} addrspace(10)*, {} addrspace(10)* addrspace(10)* %tapeld.elt18, align 8, !dbg !625, !enzyme_type !230
  %_unwrap110 = lshr i64 %3, 1, !dbg !624
  %_unwrap111 = add i64 %_unwrap110, %0, !dbg !624
  %_unwrap112 = add i64 %_unwrap111, 1, !dbg !624
  %25 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } poison, {} addrspace(10)* %tapeld.unpack, 0, !dbg !625
  %26 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %25, {} addrspace(10)* %tapeld.unpack15, 1, !dbg !625
  %27 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %26, {} addrspace(10)* %tapeld.unpack17, 2, !dbg !625
  %28 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %27, {} addrspace(10)* %tapeld.unpack19, 3, !dbg !625
  call fastcc void @diffejulia_mapreduce_impl_22268.5({} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %_unwrap112, i64 signext %1, double %differeturn, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %28), !dbg !624
  %29 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } poison, {} addrspace(10)* %tapeld117.unpack, 0, !dbg !623
  %30 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %29, {} addrspace(10)* %tapeld117.unpack8, 1, !dbg !623
  %31 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %30, {} addrspace(10)* %tapeld117.unpack10, 2, !dbg !623
  %32 = insertvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %31, {} addrspace(10)* %tapeld117.unpack12, 3, !dbg !623
  call fastcc void @diffejulia_mapreduce_impl_22268.5({} addrspace(10)* nocapture nonnull readonly align 8 dereferenceable(32) %"'", i64 signext %0, i64 signext %_unwrap111, double %differeturn, { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %32), !dbg !622
  br label %inverttop

invertload:                                       ; preds = %top
  %33 = bitcast {} addrspace(10)* %"'" to {} addrspace(10)** addrspace(10)*, !dbg !628
  %34 = addrspacecast {} addrspace(10)** addrspace(10)* %33 to {} addrspace(10)** addrspace(11)*, !dbg !628
  %"'ipl52" = load {} addrspace(10)**, {} addrspace(10)** addrspace(11)* %34, align 8, !dbg !628, !tbaa !81, !alias.scope !588, !noalias !591, !enzyme_type !80, !enzymejl_byref_BITS_VALUE !0, !enzymejl_source_type_Ptr\7BFloat64\7D !0, !enzyme_nocache !0
  %"'il_phi1" = extractvalue { {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)*, {} addrspace(10)* } %tapeArg, 0, !dbg !628, !enzyme_type !230
  %35 = call "enzyme_type"="{[-1]:Pointer, [-1,-1]:Float@double}" {} addrspace(10)* addrspace(13)* @julia.gc_loaded({} addrspace(10)* noundef %"'il_phi1", {} addrspace(10)** noundef %"'ipl52"), !dbg !631
  %_unwrap122 = add i64 %1, -1, !dbg !631
  %"'ipg_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %35, i64 %_unwrap122, !dbg !631
  %"'ipc121_unwrap" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg_unwrap" to double addrspace(13)*, !dbg !631
  %36 = load double, double addrspace(13)* %"'ipc121_unwrap", align 8, !dbg !631, !tbaa !143, !alias.scope !632, !noalias !635
  %37 = fadd fast double %36, %differeturn, !dbg !631
  store double %37, double addrspace(13)* %"'ipc121_unwrap", align 8, !dbg !631, !tbaa !143, !alias.scope !632, !noalias !637
  br label %inverttop

invertload13:                                     ; preds = %invertload21, %invertload21.prol.loopexit, %L27
  %"'de50.0" = phi double [ %differeturn, %L27 ], [ %.lcssa.unr, %invertload21.prol.loopexit ], [ %op.rdx, %invertload21 ]
  %_unwrap135 = add i64 %0, -1, !dbg !593
  %"'ipg133_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %6, i64 %_unwrap135, !dbg !593
  %38 = bitcast {} addrspace(10)* addrspace(13)* %"'ipg133_unwrap" to <2 x double> addrspace(13)*, !dbg !593
  %39 = load <2 x double>, <2 x double> addrspace(13)* %38, align 8, !dbg !593, !tbaa !143, !alias.scope !613, !noalias !616
  %40 = insertelement <2 x double> poison, double %"'de50.0", i64 0, !dbg !638
  %41 = shufflevector <2 x double> %40, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !638
  %42 = fadd fast <2 x double> %41, %39, !dbg !593
  store <2 x double> %42, <2 x double> addrspace(13)* %38, align 8, !dbg !593, !tbaa !143, !alias.scope !613, !noalias !618
  br label %inverttop

invertload21:                                     ; preds = %invertload21.preheader, %invertload21
  %"'de50.1" = phi double [ %op.rdx, %invertload21 ], [ %"'de50.1.unr", %invertload21.preheader ]
  %storemerge = phi i64 [ %_unwrap169.3, %invertload21 ], [ %storemerge.unr, %invertload21.preheader ]
  %_unwrap169 = add i64 %storemerge, -1, !dbg !610
  %_unwrap170 = add i64 %_unwrap169, %8, !dbg !610
  %"'ipg161_unwrap" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %6, i64 %_unwrap170, !dbg !610
  %"'ipc162_unwrap" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg161_unwrap" to double addrspace(13)*, !dbg !610
  %43 = load double, double addrspace(13)* %"'ipc162_unwrap", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !616
  %44 = fadd fast double %43, %differeturn, !dbg !610
  store double %44, double addrspace(13)* %"'ipc162_unwrap", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !618
  %_unwrap170.1 = add i64 %storemerge, %0, !dbg !610
  %"'ipg161_unwrap.1" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %6, i64 %_unwrap170.1, !dbg !610
  %"'ipc162_unwrap.1" = bitcast {} addrspace(10)* addrspace(13)* %"'ipg161_unwrap.1" to double addrspace(13)*, !dbg !610
  %45 = load double, double addrspace(13)* %"'ipc162_unwrap.1", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !616
  %46 = fadd fast double %45, %differeturn, !dbg !610
  store double %46, double addrspace(13)* %"'ipc162_unwrap.1", align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !618
  %_unwrap169.2 = add i64 %storemerge, -3, !dbg !610
  %_unwrap169.3 = add i64 %storemerge, -4, !dbg !610
  %_unwrap170.3 = add i64 %_unwrap169.3, %8, !dbg !610
  %"'ipg161_unwrap.3" = getelementptr inbounds {} addrspace(10)*, {} addrspace(10)* addrspace(13)* %6, i64 %_unwrap170.3, !dbg !610
  %47 = bitcast {} addrspace(10)* addrspace(13)* %"'ipg161_unwrap.3" to <2 x double> addrspace(13)*, !dbg !610
  %48 = load <2 x double>, <2 x double> addrspace(13)* %47, align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !616
  %49 = fadd fast <2 x double> %48, %20, !dbg !610
  store <2 x double> %49, <2 x double> addrspace(13)* %47, align 8, !dbg !610, !tbaa !143, !alias.scope !613, !noalias !618
  %50 = insertelement <4 x i64> poison, i64 %storemerge, i64 0
  %51 = insertelement <4 x i64> %50, i64 %_unwrap169, i64 1
  %52 = insertelement <4 x i64> %51, i64 %_unwrap169.2, i64 3
  %53 = shufflevector <4 x i64> %52, <4 x i64> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 3>
  %54 = icmp eq <4 x i64> %53, <i64 0, i64 0, i64 2, i64 0>
  %55 = select <4 x i1> %54, <4 x double> %22, <4 x double> zeroinitializer
  %op.rdx = call fast double @llvm.vector.reduce.fadd.v4f64(double %"'de50.1", <4 x double> %55)
  %56 = extractelement <4 x i1> %54, i64 3
  br i1 %56, label %invertload13, label %invertload21
}

; Function Attrs: nofree
declare void @julia.write_barrier({} addrspace(10)*, ...) local_unnamed_addr #21

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p10i8.p11i8.i64(i8 addrspace(10)* noalias nocapture writeonly, i8 addrspace(11)* noalias nocapture readonly, i64, i1 immarg) #22

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite)
declare noalias nonnull align 8 dereferenceable(8) {} addrspace(10)* @ijl_box_int64(i64 signext) local_unnamed_addr #23

declare i8* @malloc(i64) local_unnamed_addr

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #24

attributes #0 = { noinline noreturn "enzymejl_world"="26750" }
attributes #1 = { nofree memory(none) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzyme_shouldrecompute" "enzymejl_world"="26750" }
attributes #2 = { nofree memory(argmem: readwrite, inaccessiblemem: readwrite) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #3 = { nofree "enzymejl_world"="26750" }
attributes #4 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #5 = { noreturn "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #6 = { "enzyme_ta_norecur" "enzymejl_mi"="127936707459152" "enzymejl_rt"="127938216542032" "enzymejl_world"="26750" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "enzymejl_world"="26750" }
attributes #8 = { noreturn "enzymejl_world"="26750" }
attributes #9 = { norecurse nosync nounwind speculatable willreturn memory(none) "enzyme_nocache" "enzyme_shouldrecompute" "enzymejl_world"="26750" }
attributes #10 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #11 = { alwaysinline "enzymejl_world"="26750" }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) "enzymejl_world"="26750" }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: write) "enzymejl_world"="26750" }
attributes #14 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127936785911312" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #15 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127936831422544" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #16 = { "enzymejl_world"="26750" }
attributes #17 = { mustprogress noinline "enzyme_parmremove"="3" "enzyme_ta_norecur" "enzymejl_mi"="127938240516112" "enzymejl_rt"="127938131215840" "enzymejl_world"="26750" }
attributes #18 = { nocallback nofree nosync nounwind willreturn memory(none) "enzymejl_world"="26750" }
attributes #19 = { noinline noreturn "enzyme_ta_norecur" "enzymejl_mi"="127938081173200" "enzymejl_rt"="127938194110272" "enzymejl_world"="26750" }
attributes #20 = { mustprogress noinline "enzyme_parmremove"="0,3" "enzyme_ta_norecur" "enzymejl_mi"="127938240516112" "enzymejl_rt"="127938131215840" "enzymejl_world"="26750" }
attributes #21 = { nofree "enzyme_inactive" "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #22 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) "enzymejl_world"="26750" }
attributes #23 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_inactive" "enzyme_no_escaping_allocation" "enzymejl_world"="26750" }
attributes #24 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #25 = { memory(readwrite) }
attributes #26 = { nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #27 = { nofree }
attributes #28 = { noreturn }
attributes #29 = { nounwind memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #30 = { mustprogress willreturn }
attributes #31 = { mustprogress nounwind willreturn allockind("alloc,uninitialized") allocsize(1) memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #32 = { mustprogress noreturn willreturn }
attributes #33 = { mustprogress nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #34 = { mustprogress willreturn memory(readwrite) }
attributes #35 = { nounwind willreturn memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }
attributes #36 = { memory(inaccessiblemem: readwrite) "enzyme_no_escaping_allocation" }

!llvm.module.flags = !{!1, !2}
!llvm.dbg.cu = !{!3, !5, !6, !7, !8, !9, !10, !11, !12}

!0 = !{}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!4 = !DIFile(filename: "julia", directory: ".")
!5 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!6 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!7 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!8 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!9 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!10 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!11 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!12 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !4, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, nameTableKind: None)
!13 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_20945", scope: null, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !0)
!14 = !DIFile(filename: "essentials.jl", directory: ".")
!15 = !DISubroutineType(types: !0)
!16 = !{!17, !17, i64 0}
!17 = !{!"jtbaa_gcframe", !18, i64 0}
!18 = !{!"jtbaa", !19, i64 0}
!19 = !{!"jtbaa"}
!20 = !{!21, !21, i64 0, i64 0}
!21 = !{!"jtbaa_const", !18, i64 0}
!22 = !DILocation(line: 14, scope: !13)
!23 = !{!24}
!24 = !{!"jnoalias_const", !25}
!25 = !{!"jnoalias"}
!26 = !{!27, !28, !29, !30}
!27 = !{!"jnoalias_gcframe", !25}
!28 = !{!"jnoalias_stack", !25}
!29 = !{!"jnoalias_data", !25}
!30 = !{!"jnoalias_typemd", !25}
!31 = !{!32, !32, i64 0}
!32 = !{!"jtbaa_immut", !33, i64 0}
!33 = !{!"jtbaa_value", !34, i64 0}
!34 = !{!"jtbaa_data", !18, i64 0}
!35 = !{!29}
!36 = !{!37, !27, !28, !30, !24}
!37 = distinct !{!37, !38, !"na_addr13"}
!38 = distinct !{!38, !"addr13"}
!39 = distinct !DISubprogram(name: "mygradient", linkageName: "julia_mygradient_20915", scope: null, file: !40, line: 5, type: !15, scopeLine: 5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!40 = !DIFile(filename: "/home/guillaume/Work/GitHub/Julia/EnzymeErrorReproducer.jl/src/EnzymeErrorReproducer.jl", directory: ".")
!41 = !DILocation(line: 5, scope: !39)
!42 = !DILocation(line: 191, scope: !43, inlinedAt: !45)
!43 = distinct !DISubprogram(name: "size;", linkageName: "size", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!44 = !DIFile(filename: "array.jl", directory: ".")
!45 = !DILocation(line: 370, scope: !46, inlinedAt: !47)
!46 = distinct !DISubprogram(name: "similar;", linkageName: "similar", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!47 = !DILocation(line: 1196, scope: !48, inlinedAt: !50)
!48 = distinct !DISubprogram(name: "zero;", linkageName: "zero", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!49 = !DIFile(filename: "abstractarray.jl", directory: ".")
!50 = !DILocation(line: 6, scope: !39)
!51 = !{!18, !18, i64 0}
!52 = !{!30, !28}
!53 = !{!37, !27, !29, !24}
!54 = !{!"Unknown", i32 -1, !55}
!55 = !{!"Integer"}
!56 = !DILocation(line: 541, scope: !57, inlinedAt: !59)
!57 = distinct !DISubprogram(name: "_checked_mul_dims;", linkageName: "_checked_mul_dims", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!58 = !DIFile(filename: "boot.jl", directory: ".")
!59 = !DILocation(line: 571, scope: !60, inlinedAt: !61)
!60 = distinct !DISubprogram(name: "checked_dims;", linkageName: "checked_dims", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!61 = !DILocation(line: 582, scope: !62, inlinedAt: !45)
!62 = distinct !DISubprogram(name: "Array;", linkageName: "Array", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!63 = !DILocation(line: 544, scope: !57, inlinedAt: !59)
!64 = !DILocation(line: 545, scope: !57, inlinedAt: !59)
!65 = !DILocation(line: 572, scope: !60, inlinedAt: !61)
!66 = !DILocation(line: 512, scope: !67, inlinedAt: !68)
!67 = distinct !DISubprogram(name: "GenericMemory;", linkageName: "GenericMemory", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!68 = !DILocation(line: 535, scope: !69, inlinedAt: !61)
!69 = distinct !DISubprogram(name: "new_as_memoryref;", linkageName: "new_as_memoryref", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!70 = !DILocation(line: 514, scope: !67, inlinedAt: !68)
!71 = !{!"Unknown", i32 -1, !72}
!72 = !{!"Pointer", i32 0, !55, i32 1, !55, i32 2, !55, i32 3, !55, i32 4, !55, i32 5, !55, i32 6, !55, i32 7, !55, i32 8, !73}
!73 = !{!"Pointer", i32 -1, !74}
!74 = !{!"Float@double"}
!75 = !DILocation(line: 516, scope: !67, inlinedAt: !68)
!76 = !DILocation(line: 522, scope: !77, inlinedAt: !68)
!77 = distinct !DISubprogram(name: "memoryref;", linkageName: "memoryref", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!78 = !{!24, !30}
!79 = !{!27, !28, !29}
!80 = !{!"Unknown", i32 -1, !73}
!81 = !{!82, !82, i64 0}
!82 = !{!"jtbaa_arrayptr", !83, i64 0}
!83 = !{!"jtbaa_array", !18, i64 0}
!84 = !{!30}
!85 = !{!37, !27, !28, !29, !24}
!86 = !{!28, !30}
!87 = !DILocation(line: 83, scope: !88, inlinedAt: !90)
!88 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!89 = !DIFile(filename: "int.jl", directory: ".")
!90 = !DILocation(line: 650, scope: !91, inlinedAt: !93)
!91 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !92, file: !92, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!92 = !DIFile(filename: "promotion.jl", directory: ".")
!93 = !DILocation(line: 459, scope: !94, inlinedAt: !96)
!94 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!95 = !DIFile(filename: "range.jl", directory: ".")
!96 = !DILocation(line: 474, scope: !94, inlinedAt: !97)
!97 = !DILocation(line: 476, scope: !98, inlinedAt: !99)
!98 = distinct !DISubprogram(name: "oneto;", linkageName: "oneto", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!99 = !DILocation(line: 388, scope: !100, inlinedAt: !101)
!100 = distinct !DISubprogram(name: "eachindex;", linkageName: "eachindex", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!101 = !DILocation(line: 378, scope: !100, inlinedAt: !102)
!102 = !DILocation(line: 328, scope: !103, inlinedAt: !47)
!103 = distinct !DISubprogram(name: "fill!;", linkageName: "fill!", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!104 = !{!105, !105, i64 0, i64 0}
!105 = !{!"jtbaa_memorylen", !83, i64 0}
!106 = !{!27, !28, !29, !24}
!107 = !DILocation(line: 796, scope: !108, inlinedAt: !90)
!108 = distinct !DISubprogram(name: "ifelse;", linkageName: "ifelse", scope: !14, file: !14, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!109 = !DILocation(line: 83, scope: !88, inlinedAt: !110)
!110 = !DILocation(line: 379, scope: !111, inlinedAt: !113)
!111 = distinct !DISubprogram(name: ">;", linkageName: ">", scope: !112, file: !112, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!112 = !DIFile(filename: "operators.jl", directory: ".")
!113 = !DILocation(line: 681, scope: !114, inlinedAt: !115)
!114 = distinct !DISubprogram(name: "isempty;", linkageName: "isempty", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!115 = !DILocation(line: 904, scope: !116, inlinedAt: !102)
!116 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!117 = !DILocation(line: 0, scope: !39)
!118 = !DILocation(line: 986, scope: !119, inlinedAt: !120)
!119 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!120 = !DILocation(line: 329, scope: !103, inlinedAt: !47)
!121 = !DILocation(line: 86, scope: !122, inlinedAt: !118)
!122 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!123 = !DILocation(line: 513, scope: !88, inlinedAt: !118)
!124 = !{!125, !125, i64 0}
!125 = !{!"jtbaa_stack", !18, i64 0}
!126 = !{!28}
!127 = !{!37, !27, !29, !30, !24}
!128 = !DILocation(line: 987, scope: !119, inlinedAt: !120)
!129 = !DILocation(line: 5196, scope: !130, inlinedAt: !132)
!130 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !131, file: !131, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!131 = !DIFile(filename: "/home/guillaume/.julia/packages/Enzyme/ottqJ/src/compiler.jl", directory: ".")
!132 = !DILocation(line: 4742, scope: !133, inlinedAt: !134)
!133 = distinct !DISubprogram(name: "enzyme_call;", linkageName: "enzyme_call", scope: !131, file: !131, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!134 = !DILocation(line: 4614, scope: !135, inlinedAt: !136)
!135 = distinct !DISubprogram(name: "CombinedAdjointThunk;", linkageName: "CombinedAdjointThunk", scope: !131, file: !131, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!136 = !DILocation(line: 785, scope: !137, inlinedAt: !139)
!137 = distinct !DISubprogram(name: "autodiff_deferred;", linkageName: "autodiff_deferred", scope: !138, file: !138, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!138 = !DIFile(filename: "/home/guillaume/.julia/packages/Enzyme/ottqJ/src/Enzyme.jl", directory: ".")
!139 = !DILocation(line: 524, scope: !140, inlinedAt: !141)
!140 = distinct !DISubprogram(name: "autodiff;", linkageName: "autodiff", scope: !138, file: !138, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!141 = !DILocation(line: 7, scope: !39)
!142 = !DILocation(line: 8, scope: !39)
!143 = !{!144, !144, i64 0}
!144 = !{!"jtbaa_arraybuf", !34, i64 0}
!145 = !DILocation(line: 639, scope: !146, inlinedAt: !147)
!146 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !92, file: !92, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6, retainedNodes: !0)
!147 = !DILocation(line: 908, scope: !116, inlinedAt: !148)
!148 = !DILocation(line: 330, scope: !103, inlinedAt: !47)
!149 = distinct !DISubprogram(name: "diffejulia_f_cartesian_22225wrap", linkageName: "diffejulia_f_cartesian_22225wrap", scope: null, file: !40, type: !15, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!150 = !{!151}
!151 = distinct !{!151, !152, !"primal"}
!152 = distinct !{!152, !" diff: %pgcstack"}
!153 = !{!154}
!154 = distinct !{!154, !152, !"shadow_0"}
!155 = !{!156}
!156 = distinct !{!156, !157, !"primal"}
!157 = distinct !{!157, !" diff: %ptls_load101102"}
!158 = !{!159}
!159 = distinct !{!159, !157, !"shadow_0"}
!160 = !DILocation(line: 35, scope: !161, inlinedAt: !162)
!161 = distinct !DISubprogram(name: "f_cartesian", linkageName: "julia_f_cartesian_22225", scope: null, file: !40, line: 35, type: !15, scopeLine: 35, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!162 = distinct !DILocation(line: 0, scope: !149)
!163 = !DILocation(line: 191, scope: !164, inlinedAt: !165)
!164 = distinct !DISubprogram(name: "size;", linkageName: "size", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!165 = distinct !DILocation(line: 368, scope: !166, inlinedAt: !167)
!166 = distinct !DISubprogram(name: "similar;", linkageName: "similar", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!167 = distinct !DILocation(line: 14, scope: !168, inlinedAt: !169)
!168 = distinct !DISubprogram(name: "arraycube_cartesian;", linkageName: "arraycube_cartesian", scope: !40, file: !40, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!169 = distinct !DILocation(line: 36, scope: !161, inlinedAt: !162)
!170 = !{!171, !30, !28}
!171 = distinct !{!171, !172, !"primal"}
!172 = distinct !{!172, !" diff: %"}
!173 = !{!174, !175, !27, !29, !24}
!174 = distinct !{!174, !172, !"shadow_0"}
!175 = distinct !{!175, !176, !"na_addr13"}
!176 = distinct !{!176, !"addr13"}
!177 = !DILocation(line: 541, scope: !178, inlinedAt: !179)
!178 = distinct !DISubprogram(name: "_checked_mul_dims;", linkageName: "_checked_mul_dims", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!179 = distinct !DILocation(line: 571, scope: !180, inlinedAt: !181)
!180 = distinct !DISubprogram(name: "checked_dims;", linkageName: "checked_dims", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!181 = distinct !DILocation(line: 582, scope: !182, inlinedAt: !165)
!182 = distinct !DISubprogram(name: "Array;", linkageName: "Array", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!183 = !DILocation(line: 544, scope: !178, inlinedAt: !179)
!184 = !DILocation(line: 545, scope: !178, inlinedAt: !179)
!185 = !DILocation(line: 572, scope: !180, inlinedAt: !181)
!186 = !{!37, !187, !189, !27, !28, !30, !24}
!187 = distinct !{!187, !188, !"na_addr13"}
!188 = distinct !{!188, !"addr13"}
!189 = distinct !{!189, !190, !"na_addr13"}
!190 = distinct !{!190, !"addr13"}
!191 = !DILocation(line: 512, scope: !192, inlinedAt: !193)
!192 = distinct !DISubprogram(name: "GenericMemory;", linkageName: "GenericMemory", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!193 = distinct !DILocation(line: 535, scope: !194, inlinedAt: !181)
!194 = distinct !DISubprogram(name: "new_as_memoryref;", linkageName: "new_as_memoryref", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!195 = !DILocation(line: 514, scope: !192, inlinedAt: !193)
!196 = !{!197, !24}
!197 = distinct !{!197, !198, !"primal"}
!198 = distinct !{!198, !" diff: %"}
!199 = !{!200, !27, !28, !29, !30}
!200 = distinct !{!200, !198, !"shadow_0"}
!201 = !DILocation(line: 516, scope: !192, inlinedAt: !193)
!202 = !DILocation(line: 522, scope: !203, inlinedAt: !193)
!203 = distinct !DISubprogram(name: "memoryref;", linkageName: "memoryref", scope: !58, file: !58, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!204 = !{!205, !24}
!205 = distinct !{!205, !206, !"shadow_0"}
!206 = distinct !{!206, !" diff: %value_phi"}
!207 = !{!208, !27, !28, !29, !30}
!208 = distinct !{!208, !206, !"primal"}
!209 = !{!208, !24}
!210 = !{!205, !27, !28, !29, !30}
!211 = !DILocation(line: 582, scope: !182, inlinedAt: !165)
!212 = !{!213, !30}
!213 = distinct !{!213, !214, !"shadow_0"}
!214 = distinct !{!214, !" diff: %"}
!215 = !{!37, !187, !216, !175, !27, !28, !29, !24}
!216 = distinct !{!216, !214, !"primal"}
!217 = !{!216, !30}
!218 = !{!37, !187, !213, !175, !27, !28, !29, !24}
!219 = !{!216, !28, !30}
!220 = !{!37, !187, !213, !175, !27, !29, !24}
!221 = !{!222}
!222 = distinct !{}
!223 = !{!37, !187}
!224 = !{!225}
!225 = distinct !{}
!226 = !{!227}
!227 = distinct !{}
!228 = !{!171}
!229 = !{!174}
!230 = !{!"Unknown", i32 -1, !231}
!231 = !{!"Pointer"}
!232 = distinct !{}
!233 = !DILocation(line: 0, scope: !161, inlinedAt: !162)
!234 = !{!213}
!235 = !{!216}
!236 = distinct !{}
!237 = !DILocation(line: 699, scope: !238, inlinedAt: !239)
!238 = distinct !DISubprogram(name: "checkbounds;", linkageName: "checkbounds", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!239 = distinct !DILocation(line: 929, scope: !240, inlinedAt: !241)
!240 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!241 = distinct !DILocation(line: 17, scope: !168, inlinedAt: !169)
!242 = !DILocation(line: 697, scope: !238, inlinedAt: !239)
!243 = !{!37, !187, !189, !27, !29, !30, !24}
!244 = !DILocation(line: 916, scope: !245, inlinedAt: !246)
!245 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !14, file: !14, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!246 = distinct !DILocation(line: 930, scope: !240, inlinedAt: !241)
!247 = !{!248, !30}
!248 = distinct !{!248, !249, !"primal"}
!249 = distinct !{!249, !" diff: %"}
!250 = !{!251, !27, !28, !29, !24}
!251 = distinct !{!251, !249, !"shadow_0"}
!252 = !DILocation(line: 87, scope: !253, inlinedAt: !254)
!253 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!254 = distinct !DILocation(line: 3080, scope: !255, inlinedAt: !256)
!255 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!256 = distinct !DILocation(line: 3080, scope: !255, inlinedAt: !257)
!257 = distinct !DILocation(line: 3064, scope: !258, inlinedAt: !259)
!258 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!259 = distinct !DILocation(line: 3048, scope: !258, inlinedAt: !260)
!260 = distinct !DILocation(line: 1347, scope: !261, inlinedAt: !246)
!261 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !49, file: !49, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!262 = !DILocation(line: 917, scope: !245, inlinedAt: !246)
!263 = !{!248, !24}
!264 = !{!251, !27, !28, !29, !30}
!265 = !DILocation(line: 994, scope: !266, inlinedAt: !241)
!266 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!267 = !DILocation(line: 428, scope: !268, inlinedAt: !270)
!268 = distinct !DISubprogram(name: "_mapreduce;", linkageName: "_mapreduce", scope: !269, file: !269, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!269 = !DIFile(filename: "reduce.jl", directory: ".")
!270 = distinct !DILocation(line: 32, scope: !271, inlinedAt: !272)
!271 = distinct !DISubprogram(name: "mysum;", linkageName: "mysum", scope: !40, file: !40, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!272 = distinct !DILocation(line: 37, scope: !161, inlinedAt: !162)
!273 = !DILocation(line: 639, scope: !274, inlinedAt: !275)
!274 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !92, file: !92, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!275 = distinct !DILocation(line: 430, scope: !268, inlinedAt: !270)
!276 = !DILocation(line: 430, scope: !268, inlinedAt: !270)
!277 = !DILocation(line: 917, scope: !245, inlinedAt: !278)
!278 = distinct !DILocation(line: 431, scope: !268, inlinedAt: !270)
!279 = !DILocation(line: 83, scope: !280, inlinedAt: !281)
!280 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!281 = distinct !DILocation(line: 433, scope: !268, inlinedAt: !270)
!282 = !DILocation(line: 433, scope: !268, inlinedAt: !270)
!283 = !DILocation(line: 917, scope: !245, inlinedAt: !284)
!284 = distinct !DILocation(line: 435, scope: !268, inlinedAt: !270)
!285 = !DILocation(line: 916, scope: !245, inlinedAt: !286)
!286 = distinct !DILocation(line: 436, scope: !268, inlinedAt: !270)
!287 = !DILocation(line: 917, scope: !245, inlinedAt: !286)
!288 = !DILocation(line: 87, scope: !253, inlinedAt: !289)
!289 = distinct !DILocation(line: 439, scope: !268, inlinedAt: !270)
!290 = !DILocation(line: 916, scope: !245, inlinedAt: !289)
!291 = !DILocation(line: 917, scope: !245, inlinedAt: !289)
!292 = !{!293, !29}
!293 = distinct !{!293, !294, !"primal"}
!294 = distinct !{!294, !" diff: %"}
!295 = !{!296, !27, !28, !30, !24}
!296 = distinct !{!296, !294, !"shadow_0"}
!297 = !DILocation(line: 493, scope: !298, inlinedAt: !300)
!298 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !299, file: !299, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!299 = !DIFile(filename: "float.jl", directory: ".")
!300 = distinct !DILocation(line: 596, scope: !301, inlinedAt: !302)
!301 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !112, file: !112, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!302 = distinct !DILocation(line: 371, scope: !303, inlinedAt: !241)
!303 = distinct !DISubprogram(name: "literal_pow;", linkageName: "literal_pow", scope: !304, file: !304, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!304 = !DIFile(filename: "intfuncs.jl", directory: ".")
!305 = distinct !{}
!306 = !{i64 0, i64 1152921504606846975}
!307 = !{!308, !30}
!308 = distinct !{!308, !309, !"primal"}
!309 = distinct !{!309, !" diff: %"}
!310 = !{!311, !27, !28, !29, !24}
!311 = distinct !{!311, !309, !"shadow_0"}
!312 = !{!308, !24}
!313 = !{!311, !27, !28, !29, !30}
!314 = !{!315, !29}
!315 = distinct !{!315, !316, !"primal"}
!316 = distinct !{!316, !" diff: %"}
!317 = !{!37, !187, !318, !175, !27, !28, !30, !24}
!318 = distinct !{!318, !316, !"shadow_0"}
!319 = distinct !{}
!320 = !DILocation(line: 639, scope: !274, inlinedAt: !321)
!321 = distinct !DILocation(line: 908, scope: !322, inlinedAt: !323)
!322 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!323 = distinct !DILocation(line: 19, scope: !168, inlinedAt: !169)
!324 = distinct !{}
!325 = !DILocation(line: 19, scope: !168, inlinedAt: !169)
!326 = !DILocation(line: 83, scope: !280, inlinedAt: !327)
!327 = distinct !DILocation(line: 438, scope: !268, inlinedAt: !270)
!328 = !DILocation(line: 438, scope: !268, inlinedAt: !270)
!329 = distinct !{!329, !330, !331}
!330 = !{!"llvm.loop.unroll.runtime.disable"}
!331 = !{!"llvm.loop.isvectorized", i32 1}
!332 = !{!318, !29}
!333 = !{!315, !175, !27, !28, !30, !24}
!334 = !{!37, !187, !315, !175, !27, !28, !30, !24}
!335 = !{!27, !28, !30, !24}
!336 = !{!296, !29}
!337 = !{!293, !27, !28, !30, !24}
!338 = !{!37, !187, !293, !27, !28, !30, !24}
!339 = !{!"Unknown", i32 -1, !74}
!340 = !DILocation(line: 277, scope: !341, inlinedAt: !342)
!341 = distinct !DISubprogram(name: "mapreduce_impl;", linkageName: "mapreduce_impl", scope: !269, file: !269, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !11, retainedNodes: !0)
!342 = distinct !DILocation(line: 444, scope: !268, inlinedAt: !270)
!343 = !{!315, !27, !28, !30, !24}
!344 = !{!37, !187, !315, !27, !28, !30, !24}
!345 = distinct !{!345, !346}
!346 = !{!"llvm.loop.unroll.disable"}
!347 = distinct !{!347, !331, !330}
!348 = distinct !{!348, !330, !331}
!349 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22262", scope: null, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10, retainedNodes: !0)
!350 = !DILocation(line: 14, scope: !349)
!351 = !{!24, !29}
!352 = !{!37, !187, !353, !27, !28, !30}
!353 = distinct !{!353, !354, !"na_addr13"}
!354 = distinct !{!354, !"addr13"}
!355 = !{!"Integer", i64 0, !"Integer", i64 8}
!356 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22281", scope: null, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !0)
!357 = !DILocation(line: 14, scope: !356)
!358 = !{!37, !187, !353, !27, !28, !30, !24}
!359 = distinct !DISubprogram(name: "mapreduce_impl", linkageName: "julia_mapreduce_impl_22268", scope: null, file: !269, line: 253, type: !15, scopeLine: 253, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!360 = !{!361}
!361 = distinct !{!361, !362, !"primal"}
!362 = distinct !{!362, !" diff: %pgcstack"}
!363 = !{!364}
!364 = distinct !{!364, !362, !"shadow_0"}
!365 = !{!366}
!366 = distinct !{!366, !367, !"primal"}
!367 = distinct !{!367, !" diff: %ptls_load4243"}
!368 = !{!369}
!369 = distinct !{!369, !367, !"shadow_0"}
!370 = !DILocation(line: 253, scope: !359)
!371 = !DILocation(line: 639, scope: !372, inlinedAt: !373)
!372 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !92, file: !92, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!373 = !DILocation(line: 255, scope: !359)
!374 = !DILocation(line: 916, scope: !375, inlinedAt: !376)
!375 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !14, file: !14, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!376 = !DILocation(line: 256, scope: !359)
!377 = !DILocation(line: 12, scope: !378, inlinedAt: !374)
!378 = distinct !DISubprogram(name: "length;", linkageName: "length", scope: !14, file: !14, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!379 = !{!380, !30}
!380 = distinct !{!380, !381, !"shadow_0"}
!381 = distinct !{!381, !" diff: %"}
!382 = !{!383, !27, !28, !29, !24}
!383 = distinct !{!383, !381, !"primal"}
!384 = !{!383, !30}
!385 = !{!380, !27, !28, !29, !24}
!386 = !{i64 16}
!387 = !{i64 8}
!388 = !{!389, !30}
!389 = distinct !{!389, !390, !"primal"}
!390 = distinct !{!390, !" diff: %"}
!391 = !{!392, !27, !28, !29, !24}
!392 = distinct !{!392, !390, !"shadow_0"}
!393 = !{!37, !187, !394, !27, !29, !30, !24}
!394 = distinct !{!394, !395, !"na_addr13"}
!395 = distinct !{!395, !"addr13"}
!396 = !DILocation(line: 917, scope: !375, inlinedAt: !376)
!397 = !{!389, !24}
!398 = !{!392, !27, !28, !29, !30}
!399 = !DILocation(line: 86, scope: !400, inlinedAt: !401)
!400 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!401 = !DILocation(line: 258, scope: !359)
!402 = !DILocation(line: 83, scope: !403, inlinedAt: !401)
!403 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!404 = !DILocation(line: 916, scope: !375, inlinedAt: !405)
!405 = !DILocation(line: 260, scope: !359)
!406 = !DILocation(line: 12, scope: !378, inlinedAt: !404)
!407 = distinct !{}
!408 = !{!409, !30}
!409 = distinct !{!409, !410, !"primal"}
!410 = distinct !{!410, !" diff: %"}
!411 = !{!412, !27, !28, !29, !24}
!412 = distinct !{!412, !410, !"shadow_0"}
!413 = !DILocation(line: 917, scope: !375, inlinedAt: !405)
!414 = !{!409, !24}
!415 = !{!412, !27, !28, !29, !30}
!416 = !DILocation(line: 916, scope: !375, inlinedAt: !417)
!417 = !DILocation(line: 261, scope: !359)
!418 = !DILocation(line: 917, scope: !375, inlinedAt: !417)
!419 = !DILocation(line: 87, scope: !420, inlinedAt: !421)
!420 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!421 = !DILocation(line: 54, scope: !422, inlinedAt: !424)
!422 = distinct !DISubprogram(name: "simd_index;", linkageName: "simd_index", scope: !423, file: !423, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!423 = !DIFile(filename: "simdloop.jl", directory: ".")
!424 = !DILocation(line: 76, scope: !425, inlinedAt: !426)
!425 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !423, file: !423, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!426 = !DILocation(line: 263, scope: !359)
!427 = !DILocation(line: 87, scope: !420, inlinedAt: !428)
!428 = !DILocation(line: 938, scope: !429, inlinedAt: !430)
!429 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!430 = !DILocation(line: 3076, scope: !431, inlinedAt: !421)
!431 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !44, file: !44, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!432 = !DILocation(line: 926, scope: !433, inlinedAt: !434)
!433 = distinct !DISubprogram(name: "_in_unit_range;", linkageName: "_in_unit_range", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!434 = !DILocation(line: 939, scope: !429, inlinedAt: !430)
!435 = !DILocation(line: 916, scope: !375, inlinedAt: !436)
!436 = !DILocation(line: 264, scope: !437, inlinedAt: !438)
!437 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !269, file: !269, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!438 = !DILocation(line: 77, scope: !425, inlinedAt: !426)
!439 = !DILocation(line: 75, scope: !425, inlinedAt: !426)
!440 = !DILocation(line: 917, scope: !375, inlinedAt: !436)
!441 = !{!37, !187, !394, !27, !28, !30, !24}
!442 = !DILocation(line: 87, scope: !420, inlinedAt: !417)
!443 = !DILocation(line: 87, scope: !420, inlinedAt: !444)
!444 = !DILocation(line: 69, scope: !425, inlinedAt: !426)
!445 = !DILocation(line: 514, scope: !446, inlinedAt: !447)
!446 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!447 = !DILocation(line: 426, scope: !448, inlinedAt: !449)
!448 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !112, file: !112, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!449 = !DILocation(line: 419, scope: !450, inlinedAt: !451)
!450 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!451 = !DILocation(line: 408, scope: !452, inlinedAt: !453)
!452 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!453 = !DILocation(line: 5, scope: !454, inlinedAt: !444)
!454 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!455 = !DILocation(line: 86, scope: !400, inlinedAt: !456)
!456 = !DILocation(line: 768, scope: !457, inlinedAt: !458)
!457 = distinct !DISubprogram(name: "length;", linkageName: "length", scope: !95, file: !95, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!458 = !DILocation(line: 51, scope: !459, inlinedAt: !460)
!459 = distinct !DISubprogram(name: "simd_inner_length;", linkageName: "simd_inner_length", scope: !423, file: !423, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!460 = !DILocation(line: 71, scope: !425, inlinedAt: !426)
!461 = !DILocation(line: 83, scope: !403, inlinedAt: !462)
!462 = !DILocation(line: 72, scope: !425, inlinedAt: !426)
!463 = !DILocation(line: 83, scope: !403, inlinedAt: !439)
!464 = distinct !{!464}
!465 = !{!466, !29}
!466 = distinct !{!466, !467, !"shadow_0"}
!467 = distinct !{!467, !" diff: %"}
!468 = !{!469, !27, !28, !30, !24}
!469 = distinct !{!469, !467, !"primal"}
!470 = !{!37, !187, !469, !27, !28, !30, !24}
!471 = distinct !{!471, !346}
!472 = !DILocation(line: 527, scope: !473, inlinedAt: !474)
!473 = distinct !DISubprogram(name: ">>;", linkageName: ">>", scope: !89, file: !89, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!474 = !DILocation(line: 534, scope: !473, inlinedAt: !475)
!475 = !DILocation(line: 270, scope: !359)
!476 = !DILocation(line: 87, scope: !420, inlinedAt: !475)
!477 = !DILocation(line: 271, scope: !359)
!478 = !DILocation(line: 87, scope: !420, inlinedAt: !479)
!479 = !DILocation(line: 272, scope: !359)
!480 = !{!481, !29}
!481 = distinct !{!481, !482, !"shadow_0"}
!482 = distinct !{!482, !" diff: %"}
!483 = !{!484, !27, !28, !30, !24}
!484 = distinct !{!484, !482, !"primal"}
!485 = !{!37, !187, !484, !27, !28, !30, !24}
!486 = distinct !DISubprogram(name: "throw_boundserror", linkageName: "julia_throw_boundserror_22277", scope: null, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !12, retainedNodes: !0)
!487 = !DILocation(line: 14, scope: !486)
!488 = distinct !DISubprogram(name: "mapreduce_impl", linkageName: "julia_mapreduce_impl_22268", scope: null, file: !269, line: 253, type: !15, scopeLine: 253, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!489 = !{!490}
!490 = distinct !{!490, !491, !"primal"}
!491 = distinct !{!491, !" diff: %pgcstack"}
!492 = !{!493}
!493 = distinct !{!493, !491, !"shadow_0"}
!494 = !{!495}
!495 = distinct !{!495, !496, !"primal"}
!496 = distinct !{!496, !" diff: %ptls_load4243"}
!497 = !{!498}
!498 = distinct !{!498, !496, !"shadow_0"}
!499 = !DILocation(line: 253, scope: !488)
!500 = !DILocation(line: 639, scope: !372, inlinedAt: !501)
!501 = !DILocation(line: 255, scope: !488)
!502 = !DILocation(line: 916, scope: !375, inlinedAt: !503)
!503 = !DILocation(line: 256, scope: !488)
!504 = !DILocation(line: 12, scope: !378, inlinedAt: !502)
!505 = !{!506, !30}
!506 = distinct !{!506, !507, !"primal"}
!507 = distinct !{!507, !" diff: %"}
!508 = !{!509, !27, !28, !29, !24}
!509 = distinct !{!509, !507, !"shadow_0"}
!510 = !{!509, !30}
!511 = !{!506, !27, !28, !29, !24}
!512 = !{!513, !30}
!513 = distinct !{!513, !514, !"primal"}
!514 = distinct !{!514, !" diff: %"}
!515 = !{!516, !27, !28, !29, !24}
!516 = distinct !{!516, !514, !"shadow_0"}
!517 = !{!37, !187, !518, !27, !29, !30, !24}
!518 = distinct !{!518, !519, !"na_addr13"}
!519 = distinct !{!519, !"addr13"}
!520 = !DILocation(line: 917, scope: !375, inlinedAt: !503)
!521 = !{!513, !24}
!522 = !{!516, !27, !28, !29, !30}
!523 = !DILocation(line: 0, scope: !488)
!524 = !DILocation(line: 86, scope: !400, inlinedAt: !525)
!525 = !DILocation(line: 258, scope: !488)
!526 = !DILocation(line: 83, scope: !403, inlinedAt: !525)
!527 = !DILocation(line: 916, scope: !375, inlinedAt: !528)
!528 = !DILocation(line: 260, scope: !488)
!529 = !DILocation(line: 12, scope: !378, inlinedAt: !527)
!530 = !{!531, !30}
!531 = distinct !{!531, !532, !"primal"}
!532 = distinct !{!532, !" diff: %"}
!533 = !{!534, !27, !28, !29, !24}
!534 = distinct !{!534, !532, !"shadow_0"}
!535 = !DILocation(line: 917, scope: !375, inlinedAt: !528)
!536 = !{!531, !24}
!537 = !{!534, !27, !28, !29, !30}
!538 = !DILocation(line: 916, scope: !375, inlinedAt: !539)
!539 = !DILocation(line: 261, scope: !488)
!540 = !DILocation(line: 917, scope: !375, inlinedAt: !539)
!541 = !DILocation(line: 87, scope: !420, inlinedAt: !542)
!542 = !DILocation(line: 54, scope: !422, inlinedAt: !543)
!543 = !DILocation(line: 76, scope: !425, inlinedAt: !544)
!544 = !DILocation(line: 263, scope: !488)
!545 = !DILocation(line: 87, scope: !420, inlinedAt: !546)
!546 = !DILocation(line: 938, scope: !429, inlinedAt: !547)
!547 = !DILocation(line: 3076, scope: !431, inlinedAt: !542)
!548 = !DILocation(line: 926, scope: !433, inlinedAt: !549)
!549 = !DILocation(line: 939, scope: !429, inlinedAt: !547)
!550 = !DILocation(line: 916, scope: !375, inlinedAt: !551)
!551 = !DILocation(line: 264, scope: !437, inlinedAt: !552)
!552 = !DILocation(line: 77, scope: !425, inlinedAt: !544)
!553 = !DILocation(line: 75, scope: !425, inlinedAt: !544)
!554 = !DILocation(line: 917, scope: !375, inlinedAt: !551)
!555 = !DILocation(line: 527, scope: !473, inlinedAt: !556)
!556 = !DILocation(line: 534, scope: !473, inlinedAt: !557)
!557 = !DILocation(line: 270, scope: !488)
!558 = !DILocation(line: 87, scope: !420, inlinedAt: !557)
!559 = !DILocation(line: 271, scope: !488)
!560 = !DILocation(line: 87, scope: !420, inlinedAt: !561)
!561 = !DILocation(line: 272, scope: !488)
!562 = !{!37, !187, !518, !27, !28, !30, !24}
!563 = !DILocation(line: 87, scope: !420, inlinedAt: !539)
!564 = !DILocation(line: 87, scope: !420, inlinedAt: !565)
!565 = !DILocation(line: 69, scope: !425, inlinedAt: !544)
!566 = !DILocation(line: 514, scope: !446, inlinedAt: !567)
!567 = !DILocation(line: 426, scope: !448, inlinedAt: !568)
!568 = !DILocation(line: 419, scope: !450, inlinedAt: !569)
!569 = !DILocation(line: 408, scope: !452, inlinedAt: !570)
!570 = !DILocation(line: 5, scope: !454, inlinedAt: !565)
!571 = !DILocation(line: 86, scope: !400, inlinedAt: !572)
!572 = !DILocation(line: 768, scope: !457, inlinedAt: !573)
!573 = !DILocation(line: 51, scope: !459, inlinedAt: !574)
!574 = !DILocation(line: 71, scope: !425, inlinedAt: !544)
!575 = !DILocation(line: 83, scope: !403, inlinedAt: !576)
!576 = !DILocation(line: 72, scope: !425, inlinedAt: !544)
!577 = !DILocation(line: 83, scope: !403, inlinedAt: !553)
!578 = distinct !{!578}
!579 = distinct !DISubprogram(name: "mapreduce_impl", linkageName: "julia_mapreduce_impl_22268", scope: null, file: !269, line: 253, type: !15, scopeLine: 253, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!580 = !DILocation(line: 639, scope: !372, inlinedAt: !581)
!581 = !DILocation(line: 255, scope: !579)
!582 = !DILocation(line: 86, scope: !400, inlinedAt: !583)
!583 = !DILocation(line: 258, scope: !579)
!584 = !DILocation(line: 83, scope: !403, inlinedAt: !583)
!585 = !DILocation(line: 12, scope: !378, inlinedAt: !586)
!586 = !DILocation(line: 916, scope: !375, inlinedAt: !587)
!587 = !DILocation(line: 260, scope: !579)
!588 = !{!589, !30}
!589 = distinct !{!589, !590, !"shadow_0"}
!590 = distinct !{!590, !" diff: %"}
!591 = !{!592, !27, !28, !29, !24}
!592 = distinct !{!592, !590, !"primal"}
!593 = !DILocation(line: 917, scope: !375, inlinedAt: !587)
!594 = !DILocation(line: 87, scope: !420, inlinedAt: !595)
!595 = !DILocation(line: 261, scope: !579)
!596 = !DILocation(line: 87, scope: !420, inlinedAt: !597)
!597 = !DILocation(line: 69, scope: !425, inlinedAt: !598)
!598 = !DILocation(line: 263, scope: !579)
!599 = !DILocation(line: 514, scope: !446, inlinedAt: !600)
!600 = !DILocation(line: 426, scope: !448, inlinedAt: !601)
!601 = !DILocation(line: 419, scope: !450, inlinedAt: !602)
!602 = !DILocation(line: 408, scope: !452, inlinedAt: !603)
!603 = !DILocation(line: 5, scope: !454, inlinedAt: !597)
!604 = !DILocation(line: 86, scope: !400, inlinedAt: !605)
!605 = !DILocation(line: 768, scope: !457, inlinedAt: !606)
!606 = !DILocation(line: 51, scope: !459, inlinedAt: !607)
!607 = !DILocation(line: 71, scope: !425, inlinedAt: !598)
!608 = !DILocation(line: 83, scope: !403, inlinedAt: !609)
!609 = !DILocation(line: 72, scope: !425, inlinedAt: !598)
!610 = !DILocation(line: 917, scope: !375, inlinedAt: !611)
!611 = !DILocation(line: 264, scope: !437, inlinedAt: !612)
!612 = !DILocation(line: 77, scope: !425, inlinedAt: !598)
!613 = !{!614, !29}
!614 = distinct !{!614, !615, !"shadow_0"}
!615 = distinct !{!615, !" diff: %"}
!616 = !{!617, !27, !28, !30, !24}
!617 = distinct !{!617, !615, !"primal"}
!618 = !{!37, !619, !617, !27, !28, !30, !24}
!619 = distinct !{!619, !620, !"na_addr13"}
!620 = distinct !{!620, !"addr13"}
!621 = distinct !{!621, !346}
!622 = !DILocation(line: 271, scope: !579)
!623 = !DILocation(line: 87, scope: !420, inlinedAt: !624)
!624 = !DILocation(line: 272, scope: !579)
!625 = !DILocation(line: 491, scope: !626, inlinedAt: !627)
!626 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !299, file: !299, type: !15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !0)
!627 = !DILocation(line: 273, scope: !579)
!628 = !DILocation(line: 12, scope: !378, inlinedAt: !629)
!629 = !DILocation(line: 916, scope: !375, inlinedAt: !630)
!630 = !DILocation(line: 256, scope: !579)
!631 = !DILocation(line: 917, scope: !375, inlinedAt: !630)
!632 = !{!633, !29}
!633 = distinct !{!633, !634, !"shadow_0"}
!634 = distinct !{!634, !" diff: %"}
!635 = !{!636, !27, !28, !30, !24}
!636 = distinct !{!636, !634, !"primal"}
!637 = !{!37, !619, !636, !27, !28, !30, !24}
!638 = !DILocation(line: 917, scope: !375, inlinedAt: !595)
""";

function hvp_llvm(x, dx)
    return Core.Intrinsics.llvmcall(
        (llvm_module2, "@julia_mygradient_20915"), Nothing, Tuple{Any,Any}, x, dx
    )
end

hvp_llvm(x, dx)
