'use strict';

exports.handler = async (event) => {
  const response = {
    statusCode: 200,
    body: `
      Function one response
    `
  };

  return response;
}