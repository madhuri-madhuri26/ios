/*
 SFSDKAuthRequestCommand.m
 SalesforceSDKCore

 Created by Raj Rao on 9/28/17.

 Copyright (c) 2017-present, salesforce.com, inc. All rights reserved.

 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SFSDKSPLoginRequestCommand.h"
#import "SFSDKIDPConstants.h"
#import "SFSDKAuthCommand+Internal.h"
@implementation SFSDKSPLoginRequestCommand

- (NSString *)spState {
    return [self paramForKey:kSFStateParam];
}

- (void)setSpState:(NSString *)spState {
    [self setParamForKey:spState key:kSFStateParam];
}

- (NSString *)spClientId {
    return [self paramForKey:kSFOAuthClientIdParam];
}

- (void)setSpClientId:(NSString *)spClientId {
    [self setParamForKey:spClientId key:kSFOAuthClientIdParam];
}

- (NSString *)spRedirectURI {
    return [self paramForKey:kSFOAuthRedirectUrlParam];
}

- (void)setSpRedirectURI:(NSString *)spRedirectURI {
    [self setParamForKey:spRedirectURI key:kSFOAuthRedirectUrlParam];
}

- (NSString *)spCodeChallenge {
    return [self paramForKey:kSFChallengeParamName];
}

- (void)setSpCodeChallenge:(NSString *)spCodeChallenge {
    [self setParamForKey:spCodeChallenge key:kSFChallengeParamName];
}

- (NSString *)spUserHint {
    return [self paramForKey:kSFUserHintParam];
}

- (void)setSpUserHint:(NSString *)spUserHint {
    [self setParamForKey:spUserHint key:kSFUserHintParam];
}

- (NSString *)spAppName {
    return [self paramForKey:kSFAppNameParam];
}

- (void)setSpAppName:(NSString *)spAppName {
    [self setParamForKey:spAppName key:kSFAppNameParam];
}

- (NSString *)spLoginHost {
    return [self paramForKey:kSFLoginHostParam];
}

- (void)setSpLoginHost:(NSString *)spLoginHost {
    [self setParamForKey:spLoginHost key:kSFLoginHostParam];
}

- (NSString *)spAppScopes {
    return [self paramForKey:kSFScopesParam];
}

- (void)setSpAppScopes:(NSString *)spAppScopes {
    [self setParamForKey:spAppScopes key:kSFScopesParam];
}

- (NSString *)command {
    return @"authrequest";
}


@end
