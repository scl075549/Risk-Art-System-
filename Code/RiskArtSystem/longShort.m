% Compute the portfolio value today using pricers
c = PortfolioConstants;
spot_at_expiration = [];
lambda = [lambdaGE(end,:); lambdaCNQCN(end,:); lambdaSABR(end,:); lambdaHOT(end,:); lambdaFOXA(end,:); lambdaFRANCE(end,:);...
          lambdaCAT(end,:); lambdaWFC(end,:); lambdaHUNT(end,:)];
z = PricingInput(0,equities(end,:)',zeroUSD(end,1), underlying(end,:)',spot_at_expiration, impVol, zeroUSD(end,:), zeroCAD(end,:), zeroEUR(end,:), zeroCurveTimes,...
                fxUSDCAD(end), fxEURCAD(end), currentRatings, [zeros(9,1), lambda]);
            
z.historical_implied_spreads = bondSpreads(end,:);

[p0, bonds_valueZERO, options_valueZERO, stocks_valueZERO, cds_valuesZERO] = price(z);