-- Derived Metrics for Campaign Performance
SELECT 
    campaign_id,
    channel,
    impressions,
    clicks,
    conversions,
    spend,
    revenue,

    -- Click-Through Rate (CTR)
    CAST(clicks AS FLOAT) / NULLIF(impressions, 0) AS ctr,

    -- Conversion Rate
    CAST(conversions AS FLOAT) / NULLIF(clicks, 0) AS conversion_rate,

    -- Return on Investment (ROI)
    CAST(revenue AS FLOAT) / NULLIF(spend, 0) AS roi,

    -- Profitability Flag
    CASE 
        WHEN revenue > spend THEN TRUE
        ELSE FALSE
    END AS is_profitable

FROM 
    Question3_CampaignData;
