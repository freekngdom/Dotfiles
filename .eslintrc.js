// http://eslint.org/docs/user-guide/configuring

module.exports = {
    root: true, // ESLint will stop looking in parent folders once it finds a configuration with "root": true.
    parser: "babel-eslint",
    parserOptions: {
        ecmaVersion: 2017,
        sourceType: "module",
        ecmaFeatures: {
            impliedStrict: true,
            experimentalObjectRestSpread: true,
            jsx: true,
        },
    },
    env: {
        browser: true,
        commonjs: true, // CommonJS global variables and CommonJS scoping (use this for browser-only code that uses Browserify/WebPack).
        es6: true, // - enable all ECMAScript 6 features except for modules (this automatically sets the ecmaVersion parser option to 6).
        node: true,
    },
    extends: [
        // "eslint:all",
        "eslint:recommended",
        // "esnext",
        // "recommended/esnext",
        // "recommended/esnext/style-guide",
        // "recommended/react-native/style-guide",
        // "plugin:import/warnings",
        // "plugin:unicorn/recommended",
        // "airbnb-base",
        // "google",
    ],
    // 'html' required to lint *.vue files
    plugins: [ "html", "unicorn", "react" ],
    // Check if imports actually resolve
    settings: {
        "import/resolver": {
            webpack: { config: "build/webpack.base.conf.js" },
        },
    },
    //* Add your custom rules here
    //* "off" or 0
    //* "warn" or 1
    //* "error" or 2
    rules: {
        // Don't require .vue extension when importing
        "import/extensions": [
            "error",
            "always",
            {
                js: "never",
                vue: "never",
            },
        ],
        // Allow optionalDependencies
        "import/no-extraneous-dependencies": [
            "error",
            { optionalDependencies: [ "test/unit/index.js" ] },
        ],
        // Allow debugger during development
        "no-debugger": process.env.NODE_ENV === "production" ? 2 : 0,
        //* These are my rules *//
        //* These are my rules *//
        "indent": [ "error", 4 ],
        "quotes": [ "error", "single", "avoid-escape" ],
        "no-extra-parens": "warn",
        "complexity": [ "warn", 5 ],
        "no-param-reassign": "warn",
        "no-use-before-define": [ "error", { functions: false } ],

        //* Spacing. from: https://medium.freecodecamp.org/adding-some-air-to-the-airbnb-style-guide-3df40e31c57a
        // "space-in-parens": [ 2, "always" ],
        // "template-curly-spacing": [ 2, "always" ],
        // "array-bracket-spacing": [ 2, "always" ],
        // "object-curly-spacing": [ 2, "always" ],
        // "computed-property-spacing": [ 2, "always" ],
        "no-multiple-empty-lines": [
            2,
            {
                max: 1,
                maxEOF: 0,
                maxBOF: 0,
            },
        ],

        //* Below are from: https://blog.javascripting.com/2015/09/07/fine-tuning-airbnbs-eslint-config/ *//
        "max-len": [ 1, 120, 2, { ignoreComments: true } ],
        "quote-props": [ 1, "consistent-as-needed" ],
        "no-cond-assign": [ 2, "except-parens" ],
        //* Above are from: https://blog.javascripting.com/2015/09/07/fine-tuning-airbnbs-eslint-config/ *//

        //* Below are from: https://code.visualstudio.com/docs/nodejs/reactjs-tutorial *//
        "no-const-assign": "warn",
        "no-this-before-super": "warn",
        "no-undef": "warn",
        "no-unreachable": "warn",
        "no-unused-vars": "warn",
        "constructor-super": "warn",
        "valid-typeof": "warn",
        "no-extra-semi": "error",
        //* Above are from: https://code.visualstudio.com/docs/nodejs/reactjs-tutorial *//

        "valid-jsdoc": "warn",
        // "accessor-pairs": "warn",
        // "array-callback-return": "warn",
        // "block-scoped-var": "warn",
        // "consistent-return": "warn",
        // "curly": "warn",
        // "default-case": "warn",
        // "dot-location": "warn",
        // "dot-notation": "warn",
        "eqeqeq": ["error", "allow-null"],
        // "guard-for-in": "warn",
        // "no-alert": "warn",
        // "no-caller": "warn",
        // "no-div-regex": "warn",
        // "no-else-return": "warn",
        // "no-empty-function": "warn",
        // "no-eq-null": "warn",
        // "no-eval": "warn",
        // "no-extend-native": "warn",
        // "no-extra-bind": "warn",
        // "no-extra-label": "warn",
        // "no-floating-decimal": "warn",
        // "no-implicit-coercion": "warn",
        // "no-implicit-globals": "warn",
        // "no-implied-eval": "warn",
        // "no-invalid-this": "warn",
        // "no-iterator": "warn",
        // "no-labels": "warn",
        // "no-lone-blocks": "warn",
        // "no-loop-func": "warn",
        // "no-magic-numbers": "warn",
        // "no-multi-spaces": "warn",
        // "no-multi-str": "warn",
        // "no-new-func": "warn",
        // "no-new-wrappers": "warn",
        // "no-new": "warn",
        // "no-octal-escape": "warn",

        // "no-proto": "warn",
        // "no-return-assign": "warn",
        // "no-script-url": "warn",
        // "no-self-compare": "warn",
        // "no-sequences": "warn",
        // "no-throw-literal": "warn",
        // "no-unmodified-loop-condition": "warn",
        // "no-unused-expressions": "warn",
        // "no-useless-call": "warn",
        // "no-useless-concat": "warn",
        // "no-useless-escape": "warn",
        // "no-void": "warn",
        // "no-warning-comments": "warn",
        // "no-with": "warn",
        // "radix": "warn",
        // "vars-on-top": "warn",
        // "wrap-iife": "warn",
        // "yoda": "warn",
        // "strict": "error",
        // "no-label-var": "warn",
        // "no-restricted-globals": "warn",
        // "no-shadow-restricted-names": "warn",
        // "no-shadow": "warn",

        // "callback-return": "warn",
        // "global-require": "warn",
        // "handle-callback-err": "warn",
        // "no-mixed-requires": "warn",
        // "no-new-require": "warn",
        // "no-path-concat": "warn",
        // "no-process-env": "warn",
        // "no-process-exit": "warn",
        // "no-restricted-modules": "warn",
        // "no-sync": "warn",
        // "arrow-body-style": "warn",
        // "arrow-parens": "warn",
        // "arrow-spacing": "warn",
        // "generator-star-spacing": "warn",
        // "no-confusing-arrow": "warn",
        // "no-duplicate-imports": "warn",
        // "no-restricted-imports": "warn",
        // "no-useless-computed-key": "warn",
        // "no-useless-constructor": "warn",
        // "no-useless-rename": "warn",
        // "no-var": "warn",
        // "prefer-arrow-callback": "warn",
        // "prefer-reflect": "warn",
        // "prefer-rest-params": "warn",
        // "prefer-spread": "warn",
        // "prefer-template": "warn",
        // "sort-imports": "warn",
        // "template-curly-spacing": "warn",
        // "yield-star-spacing": "warn"
        //* End of my rules *//
        //* End of my rules *//
    },
};
