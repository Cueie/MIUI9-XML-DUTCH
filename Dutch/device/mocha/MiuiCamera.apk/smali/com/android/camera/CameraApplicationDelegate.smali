.class public Lcom/android/camera/CameraApplicationDelegate;
.super Lmiui/external/ApplicationDelegate;
.source "CameraApplicationDelegate.java"


# static fields
.field private static sContext:Lcom/android/camera/CameraAppImpl;


# instance fields
.field private mActivities:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mResoreSetting:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/CameraAppImpl;)V
    .locals 1
    .parameter "cameraAppImpl"

    .prologue
    .line 16
    invoke-direct {p0}, Lmiui/external/ApplicationDelegate;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mResoreSetting:Z

    .line 17
    sput-object p1, Lcom/android/camera/CameraApplicationDelegate;->sContext:Lcom/android/camera/CameraAppImpl;

    .line 18
    return-void
.end method

.method public static getAndroidContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/android/camera/CameraApplicationDelegate;->sContext:Lcom/android/camera/CameraAppImpl;

    return-object v0
.end method


# virtual methods
.method public addActivity(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 53
    if-nez p1, :cond_0

    .line 57
    :goto_0
    return-void

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public closeAllActivitiesBut(Landroid/app/Activity;)V
    .locals 4
    .parameter "current"

    .prologue
    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, activity:Landroid/app/Activity;
    const/4 v1, 0x0

    .line 69
    .local v1, i:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/CameraApplicationDelegate;->getActivityCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 70
    invoke-virtual {p0, v1}, Lcom/android/camera/CameraApplicationDelegate;->getActivity(I)Landroid/app/Activity;

    move-result-object v0

    .line 71
    if-eq v0, p1, :cond_0

    .line 72
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 73
    iget-object v3, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    invoke-virtual {v3, v0}, Ljava/util/Stack;->remove(Ljava/lang/Object;)Z

    .line 69
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 78
    :cond_1
    return-void
.end method

.method public getActivity(I)Landroid/app/Activity;
    .locals 1
    .parameter "index"

    .prologue
    .line 29
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/CameraApplicationDelegate;->getActivityCount()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0
.end method

.method public getActivityCount()I
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    return v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 22
    invoke-super {p0}, Lmiui/external/ApplicationDelegate;->onCreate()V

    .line 23
    invoke-static {p0}, Lcom/android/camera/Util;->initialize(Landroid/content/Context;)V

    .line 24
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mResoreSetting:Z

    .line 26
    return-void
.end method

.method public removeActivity(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 60
    if-nez p1, :cond_0

    .line 64
    :goto_0
    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraApplicationDelegate;->mActivities:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
