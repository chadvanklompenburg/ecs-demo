#!/usr/bin/env node
'use strict';
const argv = require('minimist')(process.argv.slice(2));
const request = require('request');

const logObj = (obj) => { console.log(JSON.stringify(obj, null, '\t')) }

if (!argv.url) {
    console.log("--url required");
    process.exit(-1);
}
let totalFetched = 0;

const getRequestPromise = (url) => {
    return new Promise((resolve, reject) => {
        request.get(url, (err, response, body) => {
            if (err) {
                reject(err);
            }
            else {
                const results = JSON.parse(body);
                resolve(results);
            }
        });
    })
    .then((response) => {
        totalFetched += response.results.length;
        if(response.next){
            console.log(`Progress: ${totalFetched}/${response.count}`);
            return getRequestPromise(response.next)
                .then((nextResults) => {
                    const totalResults = response.results.concat(nextResults);
                    //console.log(`r-length: ${response.results.length} nr-length: ${nextResults.length}`)
                    return totalResults;
                });
        }
        return response.results;
    });
}

getRequestPromise(argv.url)
    .then((results) => {
        //logObj(results);
        results.forEach((result)=> {
            if(result){
                console.log(`${result.name}`);
            }
        });
    })
    .then(() => {
        process.exit(0);
    })
    .catch((err) => {
        console.log(err);
        process.exit(-1);
    });

