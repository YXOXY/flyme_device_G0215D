.class public final Landroid/util/ShowKernel;
.super Ljava/lang/Object;
.source "ShowKernel.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ShowKernel"

.field private static final mPowerString:Ljava/lang/String; = "/sys/class/timed_output/vibrator/print"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static v(Ljava/lang/String;)I
    .locals 7
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 66
    const-string/jumbo v4, "KERNEL_PRINT"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 69
    .local v2, "time":J
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v4, "yyyy-MM-dd HH:mm:ss "

    invoke-direct {v1, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 70
    .local v1, "shortDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "sDate":Ljava/lang/String;
    const-string/jumbo v4, "/sys/class/timed_output/vibrator/print"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/ShowKernel;->wToKernelLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .end local v0    # "sDate":Ljava/lang/String;
    .end local v1    # "shortDateFormat":Ljava/text/SimpleDateFormat;
    .end local v2    # "time":J
    :cond_0
    const/4 v4, 0x0

    return v4
.end method

.method public static wToKernelLog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "strFile"    # Ljava/lang/String;
    .param p1, "strBuf"    # Ljava/lang/String;

    .prologue
    .line 46
    const/4 v2, 0x0

    .line 48
    .local v2, "out":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/FileWriter;

    invoke-direct {v4, p0}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {v3, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 55
    if-eqz v3, :cond_0

    .line 57
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    :goto_0
    move-object v2, v3

    .line 45
    .end local v3    # "out":Ljava/io/BufferedWriter;
    :cond_1
    :goto_1
    return-void

    .line 58
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    goto :goto_0

    .line 52
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    :catch_1
    move-exception v1

    .line 53
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    const-string/jumbo v4, "ShowKernel"

    const-string/jumbo v5, "IOException"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    if-eqz v2, :cond_1

    .line 57
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 58
    :catch_2
    move-exception v1

    goto :goto_1

    .line 50
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    :catch_3
    move-exception v0

    .line 51
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_3
    :try_start_5
    const-string/jumbo v4, "ShowKernel"

    const-string/jumbo v5, "FileNotFoundException start"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 55
    if-eqz v2, :cond_1

    .line 57
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_1

    .line 58
    :catch_4
    move-exception v1

    .restart local v1    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 54
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 55
    :goto_4
    if-eqz v2, :cond_2

    .line 57
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 54
    :cond_2
    :goto_5
    throw v4

    .line 58
    :catch_5
    move-exception v1

    .restart local v1    # "e":Ljava/io/IOException;
    goto :goto_5

    .line 54
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .local v2, "out":Ljava/io/BufferedWriter;
    goto :goto_4

    .line 50
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_6
    move-exception v0

    .restart local v0    # "e":Ljava/io/FileNotFoundException;
    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_3

    .line 52
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_7
    move-exception v1

    .restart local v1    # "e":Ljava/io/IOException;
    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_2
.end method
