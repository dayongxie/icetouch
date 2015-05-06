// **********************************************************************
//
// Copyright (c) 2003-2014 ZeroC, Inc. All rights reserved.
//
// This copy of Ice Touch is licensed to you under the terms described in the
// ICE_TOUCH_LICENSE file included in this distribution.
//
// **********************************************************************

#import <Ice/Ice.h>
#import <Ice/Locator.h>
#import <TestCommon.h>
#import <OperationsTest.h>
 
id<TestOperationsMyClassPrx>
operationsAllTests(id<ICECommunicator> communicator, BOOL collocated)
{
    NSString* ref = @"test:default -p 12010";
    id<ICEObjectPrx> base = [communicator stringToProxy:(ref)];
    id<TestOperationsMyClassPrx> cl = [TestOperationsMyClassPrx checkedCast:base];
    id<TestOperationsMyDerivedClassPrx> derived = [TestOperationsMyDerivedClassPrx checkedCast:cl];

    tprintf("testing twoway operations... ");
    void twoways(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    twoways(communicator, cl);
    twoways(communicator, derived);
    [derived opDerived];
    tprintf("ok\n");

    tprintf("testing oneway operations... ");
    void oneways(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    oneways(communicator, cl);
    tprintf("ok\n");
    
    tprintf("testing twoway operations with AMI... ");
    void twowaysNewAMI(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    twowaysNewAMI(communicator, cl);
    twowaysNewAMI(communicator, derived);
    tprintf("ok\n");
    
    tprintf("testing oneway operations with AMI... ");
    void onewaysNewAMI(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    onewaysNewAMI(communicator, cl);
    tprintf("ok\n");
    
    tprintf("testing batch oneway operations... ");
    void batchOneways(id<TestOperationsMyClassPrx>);
    batchOneways(cl);
    batchOneways(derived);
    tprintf("ok\n");
    
    return cl;
}
