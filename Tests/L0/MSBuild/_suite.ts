/// <reference path="../../../definitions/mocha.d.ts"/>
/// <reference path="../../../definitions/node.d.ts"/>
/// <reference path="../../../definitions/Q.d.ts"/>

import Q = require('q');
import assert = require('assert');
import trm = require('../../lib/taskRunner');
import psm = require('../../lib/psRunner');
import path = require('path');
var shell = require('shelljs');
var ps = shell.which('powershell');
console.log(ps);
describe('MSBuild Suite', function () {
    this.timeout(10000);

    before((done) => {
        // init here
        done();
    });

    after(function () {
    });

    if (ps) {
        it('(Format-MSBuildArguments) adds configuration property', (done) => {
            psm.runPS(path.join(__dirname, 'Format-MSBuildArguments.AddsConfigurationProperty.ps1'), done);
        })
        it('(Format-MSBuildArguments) adds platform property', (done) => {
            psm.runPS(path.join(__dirname, 'Format-MSBuildArguments.AddsPlatformProperty.ps1'), done);
        })
        it('(Get-SolutionFiles) resolves asterisks', (done) => {
            psm.runPS(path.join(__dirname, 'Get-SolutionFiles.ResolvesAsterisks.ps1'), done);
        })
        it('(Get-SolutionFiles) resolves question marks', (done) => {
            psm.runPS(path.join(__dirname, 'Get-SolutionFiles.ResolvesQuestionMarks.ps1'), done);
        })
        it('(Get-SolutionFiles) returns non-wildcard solution', (done) => {
            psm.runPS(path.join(__dirname, 'Get-SolutionFiles.ReturnsNonWildcardSolution.ps1'), done);
        })
        it('(Get-SolutionFiles) throws if no solution', (done) => {
            psm.runPS(path.join(__dirname, 'Get-SolutionFiles.ThrowsIfNoSolution.ps1'), done);
        })
        it('(Get-SolutionFiles) throws if no solution found', (done) => {
            psm.runPS(path.join(__dirname, 'Get-SolutionFiles.ThrowsIfNoSolutionFound.ps1'), done);
        })
        it('(Invoke-BuildTools) invokes all tools for all files', (done) => {
            psm.runPS(path.join(__dirname, 'Invoke-BuildTools.InvokesAllToolsForAllFiles.ps1'), done);
        })
        it('(Invoke-BuildTools) skips clean if specified', (done) => {
            psm.runPS(path.join(__dirname, 'Invoke-BuildTools.SkipsCleanIfSpecified.ps1'), done);
        })
        it('(Invoke-BuildTools) skips restore if specified', (done) => {
            psm.runPS(path.join(__dirname, 'Invoke-BuildTools.SkipsRestoreIfSpecified.ps1'), done);
        })
        it('(Invoke-BuildTools) skips restore if NuGet not found', (done) => {
            psm.runPS(path.join(__dirname, 'Invoke-BuildTools.SkipsRestoreIfNuGetNotFound.ps1'), done);
        })
        it('(Select-MSBuildLocation) defaults method to location if location', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) defaults method to version if no location', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) returns latest version', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) returns user-specified version', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) returns user-specified location', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) reverts method to version if no location', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) reverts to latest version if version not found', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('(Select-MSBuildLocation) throws if not found', (done) => {
            psm.runPS(path.join(__dirname, 'QQQ.ps1'), done);
        })
        it('parses without error', (done) => {
            psm.runPS(path.join(__dirname, 'ParsesWithoutError.ps1'), done);
        })
        it('passes arguments', (done) => {
            psm.runPS(path.join(__dirname, 'PassesArguments.ps1'), done);
        })
    }
});