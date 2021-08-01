const webpack = require('webpack');
const path = require('path');
const nodeExternals = require('webpack-node-externals');
const TerserPlugin = require('terser-webpack-plugin');

const _ =require('lodash');
// const StartServerPlugin = require('start-server-webpack-plugin');
// const CopyWebpackPlugin = require('copy-webpack-plugin');
// const Dotenv = require('dotenv-webpack');

const {
  NODE_ENV = 'production',
} = process.env;

module.exports = {
  devtool: 'source-map',
  entry: [
    // "@babel/polyfill",
    './src/index'
  ],
  output: { path: path.join(__dirname, 'dist'), filename: 'server.js' },
  mode: NODE_ENV,
  watch: NODE_ENV === 'development',
  target: 'node',
  node: {
    __filename: true,
    __dirname: true,
    fs: 'empty'
  },
  externals: [nodeExternals({
    // whitelist: ['webpack/hot/poll?1000']
  })],
  module: {
    rules: [
      {
        test: /\.js?$/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              babelrc: false,
              presets: ['@babel/env'],
              plugins: [
                "@babel/plugin-transform-regenerator",
                "@babel/plugin-transform-runtime",
                '@babel/plugin-syntax-dynamic-import',
                '@babel/plugin-proposal-object-rest-spread'
              ]
            }
          },
          // {
          //   test: /\.css$/,
          //   use: [
          //     'style-loader',
          //     'css-loader'
          //   ],
          // },

        ],
        exclude: /node_modules/
      }
    ]
  },
  resolve: {
    extensions: ['.js', '.jsx', '.json'],
  },
  plugins: [
    // new StartServerPlugin('server.js'),
    new webpack.NamedModulesPlugin(),
    // new webpack.NoEmitOnErrorsPlugin(),
    /* new CopyWebpackPlugin([
      { from: './src/rsaKey', to: 'rsaKey' },
    ],
      { copyUnmodified: false }
    ), */
  ],
  optimization: {
    minimizer: [
      new TerserPlugin({
        sourceMap: true, // Must be set to true if using source-maps in production
        terserOptions: {
          compress: {
            drop_console: false,
          },
        },
      }),
    ],
    splitChunks: {
      chunks: 'all',
      hidePathInfo: false,
      minSize: 10000,
      maxAsyncRequests: Infinity,
      maxInitialRequests: Infinity,
    },
  },
  performance: {
    hints: "warning", // enum
    maxAssetSize: 200000, // int (in bytes),
    maxEntrypointSize: 400000, // int (in bytes)
    assetFilter: function(assetFilename) {
      // Function predicate that provides asset filenames
      return assetFilename.endsWith('.css') || assetFilename.endsWith('.js');
    }
  }
};
