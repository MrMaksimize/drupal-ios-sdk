//
//  DIOSComment.m
//
// ***** BEGIN LICENSE BLOCK *****
// Version: MPL 1.1/GPL 2.0
//
// The contents of this file are subject to the Mozilla Public License Version
// 1.1 (the "License"); you may not use this file except in compliance with
// the License. You may obtain a copy of the License at
// http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
// for the specific language governing rights and limitations under the
// License.
//
// The Original Code is Kyle Browning, released June 27, 2010.
//
// The Initial Developer of the Original Code is
// Kyle Browning
// Portions created by the Initial Developer are Copyright (C) 2010
// the Initial Developer. All Rights Reserved.
//
// Contributor(s):
//
// Alternatively, the contents of this file may be used under the terms of
// the GNU General Public License Version 2 or later (the "GPL"), in which
// case the provisions of the GPL are applicable instead of those above. If
// you wish to allow use of your version of this file only under the terms of
// the GPL and not to allow others to use your version of this file under the
// MPL, indicate your decision by deleting the provisions above and replacing
// them with the notice and other provisions required by the GPL. If you do
// not delete the provisions above, a recipient may use your version of this
// file under either the MPL or the GPL.
//
// ***** END LICENSE BLOCK *****


#import "DIOSComment.h"
#import "DIOSSession.h"
@implementation DIOSComment


#pragma mark CommentGet
- (void)commentGet:(NSDictionary *)comment 
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
  
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] 
                            parameters:nil 
                               success:success 
                               failure:failure];
}

#pragma mark commentSave
- (void)commentSave:(NSDictionary *)comment 
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseComment] 
                             parameters:comment 
                                success:success 
                                failure:failure];
}

#pragma mark commentUpdate
- (void)commentUpdate:(NSDictionary *)comment  
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
  [[DIOSSession sharedSession] putPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] 
                            parameters:comment 
                               success:success
                               failure:failure];
}

#pragma mark CommentDelete
- (void)commentDelete:(NSDictionary *)comment 
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure; {
  [[DIOSSession sharedSession] deletePath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] parameters:comment success:success failure:failure];
}

#pragma mark commentIndex
//Simpler method if you didnt want to build the params :)
- (void)commentIndexWithPage:(NSString *)page 
                      fields:(NSString *)fields 
                  parameters:(NSArray *)parameteres 
                    pageSize:(NSString *)pageSize
                     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
  
  NSMutableDictionary *commentIndexDict = [NSMutableDictionary new];
  [commentIndexDict setValue:page forKey:@"page"];
  [commentIndexDict setValue:fields forKey:@"fields"];
  [commentIndexDict setValue:parameteres forKey:@"parameters"];
  [commentIndexDict setValue:pageSize forKey:@"pagesize"];  
  [self commentIndex:commentIndexDict success:success failure:failure];
}

- (void)commentIndex:(NSDictionary *)params 
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure; {
  
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseComment] 
                            parameters:params 
                               success:success 
                               failure:failure];
}
@end