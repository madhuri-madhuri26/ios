/*
 Copyright (c) 2013-present, salesforce.com, inc. All rights reserved.
 
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

#import "SFNativeRestRequestListener.h"
#import <SalesforceSDKCommon/SFLogger.h>

int class_uid = 0;

@interface SFNativeRestRequestListener ()
{
    int uid;
}

@end

@implementation SFNativeRestRequestListener

@synthesize request = _request;

- (id)initWithRequest:(SFRestRequest *)request {
    self = [super init];
    if (self) {
        self.request = request;
        self.request.requestDelegate = self;
        self->uid = class_uid++;
        [SFLogger log:[self class] level:SFLogLevelDebug format:@"## created listener %d", self->uid];
    }
    return self;
}

- (void)dealloc
{
    self.request.requestDelegate = nil;
    self.request = nil;
}

- (NSString *)serviceTypeDescription
{
    return @"SFRestRequest";
}

#pragma mark - SFRestRequestDelegate

- (void)request:(SFRestRequest *)request didSucceed:(id)dataResponse rawResponse:(NSURLResponse *)rawResponse {
    if (self.sleepDuringLoad > 0) {
        [NSThread sleepForTimeInterval:self.sleepDuringLoad];
    }
    self.dataResponse = dataResponse;
    self.returnStatus = kTestRequestStatusDidLoad;
    self.rawResponse = rawResponse;
}

- (void)request:(SFRestRequest *)request didFail:(id)dataResponse rawResponse:(NSURLResponse *)rawResponse error:(NSError *)error {
    self.lastError = error;
    self.returnStatus = kTestRequestStatusDidFail;
    self.rawResponse = rawResponse;
    self.dataResponse = dataResponse;
}

@end
