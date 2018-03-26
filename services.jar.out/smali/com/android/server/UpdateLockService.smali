.class public Lcom/android/server/UpdateLockService;
.super Landroid/os/IUpdateLock$Stub;
.source "UpdateLockService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/UpdateLockService$LockWatcher;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final PERMISSION:Ljava/lang/String; = "android.permission.UPDATE_LOCK"

.field static final TAG:Ljava/lang/String; = "UpdateLockService"


# instance fields
.field mContext:Landroid/content/Context;

.field mLocks:Lcom/android/server/UpdateLockService$LockWatcher;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-direct {p0}, Landroid/os/IUpdateLock$Stub;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/android/server/UpdateLockService;->mContext:Landroid/content/Context;

    .line 67
    new-instance v0, Lcom/android/server/UpdateLockService$LockWatcher;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    const-string/jumbo v2, "UpdateLocks"

    invoke-direct {v0, p0, v1, v2}, Lcom/android/server/UpdateLockService$LockWatcher;-><init>(Lcom/android/server/UpdateLockService;Landroid/os/Handler;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/UpdateLockService;->mLocks:Lcom/android/server/UpdateLockService$LockWatcher;

    .line 71
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/server/UpdateLockService;->sendLockChangedBroadcast(Z)V

    .line 65
    return-void
.end method

.method private makeTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 113
    const-string/jumbo v1, " uid="

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 113
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 114
    const-string/jumbo v1, " pid="

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 114
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 114
    const/16 v1, 0x7d

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public DEBUG()Z
    .locals 2

    .prologue
    .line 75
    const-string/jumbo v0, "KERNEL_PRINT"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public acquireUpdateLock(Landroid/os/IBinder;Ljava/lang/String;)V
    .locals 3
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/android/server/UpdateLockService;->DEBUG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    const-string/jumbo v0, "UpdateLockService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "acquire("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") by "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/android/server/UpdateLockService;->makeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.UPDATE_LOCK"

    const-string/jumbo v2, "acquireUpdateLock"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mLocks:Lcom/android/server/UpdateLockService$LockWatcher;

    invoke-direct {p0, p2}, Lcom/android/server/UpdateLockService;->makeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/android/server/UpdateLockService$LockWatcher;->acquire(Landroid/os/IBinder;Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.DUMP"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Permission Denial: can\'t dump update lock service from from pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 122
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 123
    const-string/jumbo v1, ", uid="

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 123
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 124
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mLocks:Lcom/android/server/UpdateLockService$LockWatcher;

    invoke-virtual {v0, p2}, Lcom/android/server/UpdateLockService$LockWatcher;->dump(Ljava/io/PrintWriter;)V

    .line 118
    return-void
.end method

.method public releaseUpdateLock(Landroid/os/IBinder;)V
    .locals 3
    .param p1, "token"    # Landroid/os/IBinder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/android/server/UpdateLockService;->DEBUG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    const-string/jumbo v0, "UpdateLockService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "release("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.UPDATE_LOCK"

    const-string/jumbo v2, "releaseUpdateLock"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lcom/android/server/UpdateLockService;->mLocks:Lcom/android/server/UpdateLockService$LockWatcher;

    invoke-virtual {v0, p1}, Lcom/android/server/UpdateLockService$LockWatcher;->release(Landroid/os/IBinder;)V

    .line 102
    return-void
.end method

.method sendLockChangedBroadcast(Z)V
    .locals 8
    .param p1, "state"    # Z

    .prologue
    .line 79
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 81
    .local v2, "oldIdent":J
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "android.os.UpdateLock.UPDATE_LOCK_CHANGED"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 82
    const-string/jumbo v4, "nowisconvenient"

    .line 81
    invoke-virtual {v1, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    .line 83
    const-string/jumbo v4, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 81
    invoke-virtual {v1, v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v1

    .line 84
    const/high16 v4, 0x4000000

    .line 81
    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 85
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/server/UpdateLockService;->mContext:Landroid/content/Context;

    sget-object v4, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v4}, Landroid/content/Context;->sendStickyBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 77
    return-void

    .line 86
    .end local v0    # "intent":Landroid/content/Intent;
    :catchall_0
    move-exception v1

    .line 87
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 86
    throw v1
.end method
