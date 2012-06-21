.class public Lcom/android/server/enterprise/EmailPolicy;
.super Landroid/app/enterprise/IEmailPolicy$Stub;
.source "EmailPolicy.java"

# interfaces
.implements Lcom/android/server/enterprise/EnterpriseServiceCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "EmailPolicyService"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

.field mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/enterprise/IEmailPolicy$Stub;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 43
    iput-object p1, p0, Lcom/android/server/enterprise/EmailPolicy;->mContext:Landroid/content/Context;

    .line 44
    new-instance v0, Lcom/android/server/enterprise/EdmStorageProvider;

    iget-object v1, p0, Lcom/android/server/enterprise/EmailPolicy;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/EdmStorageProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;

    .line 45
    return-void
.end method

.method private enforceEmailPermission()I
    .locals 2

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->getEDM()Landroid/app/enterprise/EnterpriseDeviceManager;

    move-result-object v0

    const-string v1, "android.permission.sec.MDM_EMAIL"

    invoke-virtual {v0, v1}, Landroid/app/enterprise/EnterpriseDeviceManager;->enforceActiveAdminPermission(Ljava/lang/String;)V

    .line 39
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    return v0
.end method

.method private getCertificateName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "emailAddress"
    .parameter "policy"

    .prologue
    .line 114
    const/4 v6, 0x1

    new-array v0, v6, [Ljava/lang/String;

    .line 115
    .local v0, columns:[Ljava/lang/String;
    const/4 v6, 0x0

    aput-object p2, v0, v6

    .line 117
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 118
    .local v2, cvWhere:Landroid/content/ContentValues;
    const-string v6, "EmailAddress"

    invoke-virtual {v2, v6, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v6, p0, Lcom/android/server/enterprise/EmailPolicy;->mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;

    const-string v7, "EmailSettingsTable"

    invoke-virtual {v6, v7, v0, v2}, Lcom/android/server/enterprise/EdmStorageProvider;->getValuesList(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)Ljava/util/List;

    move-result-object v5

    .line 123
    .local v5, results:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 124
    :cond_0
    const-string v4, ""

    .line 137
    :goto_0
    return-object v4

    .line 126
    :cond_1
    const-string v6, "EmailPolicyService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getCertificateName: results = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 130
    .local v3, it:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 131
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentValues;

    .line 132
    .local v1, cv:Landroid/content/ContentValues;
    invoke-virtual {v1, p2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 133
    .local v4, name:Ljava/lang/String;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    goto :goto_0

    .line 137
    .end local v1           #cv:Landroid/content/ContentValues;
    .end local v4           #name:Ljava/lang/String;
    :cond_3
    const-string v4, ""

    goto :goto_0
.end method

.method private getDefaultValueState(Ljava/lang/String;)Z
    .locals 2
    .parameter "policy"

    .prologue
    .line 190
    const/4 v0, 0x0

    .line 191
    .local v0, ret:Z
    const-string v1, "EmailReqSigSmime"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 192
    const/4 v0, 0x0

    .line 200
    :cond_0
    :goto_0
    return v0

    .line 194
    :cond_1
    const-string v1, "EmailReqEncryptSmime"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 195
    const/4 v0, 0x0

    goto :goto_0

    .line 197
    :cond_2
    const-string v1, "EmailAllowForward"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 198
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private getEDM()Landroid/app/enterprise/EnterpriseDeviceManager;
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    if-nez v0, :cond_0

    .line 27
    iget-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mContext:Landroid/content/Context;

    const-string v1, "enterprise_policy"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/enterprise/EnterpriseDeviceManager;

    iput-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/server/enterprise/EmailPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    return-object v0
.end method

.method private getPolicyState(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .parameter "emailAddress"
    .parameter "policy"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 162
    new-array v0, v6, [Ljava/lang/String;

    .line 163
    .local v0, columns:[Ljava/lang/String;
    aput-object p2, v0, v7

    .line 165
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 166
    .local v2, cvWhere:Landroid/content/ContentValues;
    const-string v8, "EmailAddress"

    invoke-virtual {v2, v8, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    iget-object v8, p0, Lcom/android/server/enterprise/EmailPolicy;->mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;

    const-string v9, "EmailSettingsTable"

    invoke-virtual {v8, v9, v0, v2}, Lcom/android/server/enterprise/EdmStorageProvider;->getValuesList(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)Ljava/util/List;

    move-result-object v5

    .line 171
    .local v5, results:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 172
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/server/enterprise/EmailPolicy;->getDefaultValueState(Ljava/lang/String;)Z

    move-result v4

    .line 186
    :goto_0
    return v4

    .line 174
    :cond_1
    const-string v8, "EmailPolicyService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getPolicyState: results = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    invoke-direct {p0, p2}, Lcom/android/server/enterprise/EmailPolicy;->getDefaultValueState(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    move v4, v6

    .line 179
    .local v4, restricterState:Z
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 180
    .local v3, it:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 181
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentValues;

    .line 182
    .local v1, cv:Landroid/content/ContentValues;
    invoke-virtual {v1, p2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v4, :cond_4

    const-string v8, "1"

    :goto_2
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_0

    .end local v1           #cv:Landroid/content/ContentValues;
    .end local v3           #it:Ljava/util/Iterator;
    .end local v4           #restricterState:Z
    :cond_3
    move v4, v7

    .line 177
    goto :goto_1

    .line 182
    .restart local v1       #cv:Landroid/content/ContentValues;
    .restart local v3       #it:Ljava/util/Iterator;
    .restart local v4       #restricterState:Z
    :cond_4
    const-string v8, "0"

    goto :goto_2

    .line 186
    .end local v1           #cv:Landroid/content/ContentValues;
    :cond_5
    if-nez v4, :cond_6

    :goto_3
    move v4, v6

    goto :goto_0

    :cond_6
    move v6, v7

    goto :goto_3
.end method

.method private putPolicyState(ILjava/lang/String;ZLjava/lang/String;)Z
    .locals 6
    .parameter "admin"
    .parameter "emailAddress"
    .parameter "state"
    .parameter "policy"

    .prologue
    .line 142
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 143
    :cond_0
    const-string v3, "EmailPolicyService"

    const-string v4, "putPolicyState: Invalid entry"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    const/4 v2, 0x0

    .line 158
    :goto_0
    return v2

    .line 147
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 148
    .local v0, cv:Landroid/content/ContentValues;
    const-string v3, "adminUid"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 149
    const-string v3, "EmailAddress"

    invoke-virtual {v0, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    if-eqz p3, :cond_2

    const-string v3, "1"

    :goto_1
    invoke-virtual {v0, p4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 153
    .local v1, cvWhere:Landroid/content/ContentValues;
    const-string v3, "adminUid"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 154
    const-string v3, "EmailAddress"

    invoke-virtual {v1, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v3, p0, Lcom/android/server/enterprise/EmailPolicy;->mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;

    const-string v4, "EmailSettingsTable"

    invoke-virtual {v3, v4, v0, v1}, Lcom/android/server/enterprise/EdmStorageProvider;->putValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/content/ContentValues;)Z

    move-result v2

    .line 157
    .local v2, ret:Z
    const-string v3, "EmailPolicyService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "putPolicyState: ret = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 150
    .end local v1           #cvWhere:Landroid/content/ContentValues;
    .end local v2           #ret:Z
    :cond_2
    const-string v3, "0"

    goto :goto_1
.end method

.method private setCertificateName(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .parameter "admin"
    .parameter "emailAddress"
    .parameter "certName"
    .parameter "policy"

    .prologue
    .line 94
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 95
    :cond_0
    const-string v3, "EmailPolicyService"

    const-string v4, "setCertificateName: Invalid entry"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    const/4 v2, 0x0

    .line 110
    .end local p3
    :goto_0
    return v2

    .line 99
    .restart local p3
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 100
    .local v0, cv:Landroid/content/ContentValues;
    const-string v3, "adminUid"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 101
    const-string v3, "EmailAddress"

    invoke-virtual {v0, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    if-nez p3, :cond_2

    const-string p3, ""

    .end local p3
    :cond_2
    invoke-virtual {v0, p4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 105
    .local v1, cvWhere:Landroid/content/ContentValues;
    const-string v3, "adminUid"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 106
    const-string v3, "EmailAddress"

    invoke-virtual {v1, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    iget-object v3, p0, Lcom/android/server/enterprise/EmailPolicy;->mEdmStorageProvider:Lcom/android/server/enterprise/EdmStorageProvider;

    const-string v4, "EmailSettingsTable"

    invoke-virtual {v3, v4, v0, v1}, Lcom/android/server/enterprise/EdmStorageProvider;->putValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/content/ContentValues;)Z

    move-result v2

    .line 109
    .local v2, ret:Z
    const-string v3, "EmailPolicyService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setCertificateName: ret = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public getAllowEmailForwarding(Ljava/lang/String;)Z
    .locals 1
    .parameter "emailAddress"

    .prologue
    .line 89
    const-string v0, "EmailAllowForward"

    invoke-direct {p0, p1, v0}, Lcom/android/server/enterprise/EmailPolicy;->getPolicyState(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getRequireEncryptedSMIMEMessages(Ljava/lang/String;)Z
    .locals 1
    .parameter "emailAddress"

    .prologue
    .line 62
    const-string v0, "EmailReqEncryptSmime"

    invoke-direct {p0, p1, v0}, Lcom/android/server/enterprise/EmailPolicy;->getPolicyState(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getRequireSignedSMIMEMessages(Ljava/lang/String;)Z
    .locals 1
    .parameter "emailAddress"

    .prologue
    .line 53
    const-string v0, "EmailReqSigSmime"

    invoke-direct {p0, p1, v0}, Lcom/android/server/enterprise/EmailPolicy;->getPolicyState(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getSMIMEEncryptionCertificateName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "emailAddress"

    .prologue
    .line 80
    const-string v0, "EmailEncryptCertName"

    invoke-direct {p0, p1, v0}, Lcom/android/server/enterprise/EmailPolicy;->getCertificateName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSMIMESigningCertificateName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "emailAddress"

    .prologue
    .line 71
    const-string v0, "EmailSigningCertName"

    invoke-direct {p0, p1, v0}, Lcom/android/server/enterprise/EmailPolicy;->getCertificateName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onAdminAdded(I)V
    .locals 0
    .parameter "uid"

    .prologue
    .line 213
    return-void
.end method

.method public onAdminRemoved(I)V
    .locals 0
    .parameter "uid"

    .prologue
    .line 225
    return-void
.end method

.method public onPreAdminRemoval(I)V
    .locals 0
    .parameter "uid"

    .prologue
    .line 219
    return-void
.end method

.method public setAllowEmailForwarding(Ljava/lang/String;Z)Z
    .locals 2
    .parameter "emailAddress"
    .parameter "allow"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->enforceEmailPermission()I

    move-result v0

    .line 85
    .local v0, adminUid:I
    const-string v1, "EmailAllowForward"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/server/enterprise/EmailPolicy;->putPolicyState(ILjava/lang/String;ZLjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setRequireEncryptedSMIMEMessages(Ljava/lang/String;Z)Z
    .locals 2
    .parameter "emailAddress"
    .parameter "enable"

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->enforceEmailPermission()I

    move-result v0

    .line 58
    .local v0, adminUid:I
    const-string v1, "EmailReqEncryptSmime"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/server/enterprise/EmailPolicy;->putPolicyState(ILjava/lang/String;ZLjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setRequireSignedSMIMEMessages(Ljava/lang/String;Z)Z
    .locals 2
    .parameter "emailAddress"
    .parameter "enable"

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->enforceEmailPermission()I

    move-result v0

    .line 49
    .local v0, adminUid:I
    const-string v1, "EmailReqSigSmime"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/server/enterprise/EmailPolicy;->putPolicyState(ILjava/lang/String;ZLjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setSMIMEEncryptionCertificateName(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "emailAddress"
    .parameter "certName"

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->enforceEmailPermission()I

    move-result v0

    .line 76
    .local v0, adminUid:I
    const-string v1, "EmailEncryptCertName"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/server/enterprise/EmailPolicy;->setCertificateName(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setSMIMESigningCertificateName(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "emailAddress"
    .parameter "certName"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/server/enterprise/EmailPolicy;->enforceEmailPermission()I

    move-result v0

    .line 67
    .local v0, adminUid:I
    const-string v1, "EmailSigningCertName"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/server/enterprise/EmailPolicy;->setCertificateName(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public systemReady()V
    .locals 0

    .prologue
    .line 207
    return-void
.end method