# Revisiting the Relationship between Parents’ Education and Children’s Educational Achievement: New Evidence from Malawi

**Author**: Pham Minh Tu  
**Student ID**: 16073  
**Email**: 16073@student.vgu.edu.vn  
**Study Program**: Finance and Accounting  
**Institution**: Vietnamese-German University  
**Supervisor**: Dr. Van Ha Le, Faculty of Economics and Management  

---

## Abstract
This thesis examines how parental education affects children's educational achievements in Malawi, with a focus on cases where children are left without parental support due to early parental death. Using data from the World Bank’s Third Integrated Household Survey and a probit model, this study assesses the probability of educational success in children lacking parental guidance. Results suggest that maternal education has a larger positive impact on children's education than paternal education, underscoring the critical role of a nurturing environment over genetic inheritance in determining educational outcomes.

---

## Table of Contents
- [Introduction](#introduction)
- [Literature Review](#literature-review)
- [Data and Methodology](#data-and-methodology)
- [Results](#results)
  - [Coefficient Estimates](#coefficient-estimates)
  - [Marginal Effects](#marginal-effects)
- [Policy Implications](#policy-implications)
- [Limitations and Future Research](#limitations-and-future-research)
- [Conclusion](#conclusion)

---

## Introduction
This study investigates the intergenerational transmission of education in Malawi, emphasizing how socio-economic factors, including parental mortality, affect children's educational achievements. The aim is to understand whether genetic factors or environmental factors (nurture) play a more significant role. Given Malawi’s high poverty rate and the prevalent issue of early parental death, this context offers a unique opportunity to study these dynamics.

## Literature Review
The literature review explores the intergenerational transmission of education and examines various methodologies, such as studying adopted children and conditional second moments analysis, to differentiate the impact of genetics and environment. The works of researchers like Sacerdote (2000), Farré et al. (2009), and Liu et al. (2022) underscore the role of parental education and the benefits of nurturing environments on children’s educational outcomes.

## Data and Methodology
### Data Source
This analysis relies on the Third Integrated Household Survey (IHS3) conducted in Malawi by the World Bank and Malawi's National Statistical Office. The dataset includes over 55,000 observations from households across Malawi, covering variables such as educational attainment, household demographics, and parental presence.

### Analytical Model
A probit regression model is used to assess the probability of a child achieving specific educational milestones based on parental education levels and other socio-demographic factors. Key independent variables include parental education and presence, with controls to address potential confounders. The model specification is as follows:

$$
P(\text{Child educational achievement}) = \Phi(\beta_0 + \beta_1 \text{mom/dad/both educational achievement} + \text{... other controls})
$$

where \( \Phi \) represents the cumulative distribution function of the standard normal distribution.

## Results

### Coefficient Estimates
The coefficient estimates from the probit model provide insights into the relationship between parental education levels and children's academic outcomes. The results are detailed below:

| **Variable**                  | **Coefficient** | **Std. Error** | **t-stat** | **p-value** |
|-------------------------------|-----------------|----------------|------------|-------------|
| Father (University Degree)    | 1.4532***       | 0.4482         | -          | <0.01       |
| Mother (University Degree)    | 1.5005*         | 0.7172         | -          | <0.05       |
| Father (Non-University Degree)| 1.1281**        | 0.5101         | -          | <0.05       |
| Mother (Non-University Degree)| 0.8537          | 0.6997         | -          | n.s.        |
| Father (MSCE Diploma)         | 1.1563***       | 0.3805         | -          | <0.01       |
| Mother (MSCE Diploma)         | 1.3897***       | 0.2782         | -          | <0.01       |

Standard errors are shown in parentheses, with *** indicating significance at 1%, ** at 5%, and * at 10%rginal Effects
The Average Partial Effects (APE) reveal that maternal education substantially increases the probability of children’s educational attainment, especially at university and MSCE diploma levels.

| **Sample Characteristics**     | **Child’s Outcome** | **Father** | **Mother** | **Father + Mother** |
|--------------------------------|---------------------|------------|------------|----------------------|
| University Degree              | Parents died before age 11 | 0.0275*** (0.0110) | 0.3438* (0.0187) | 0.0306*** (0.0116) |
| Non-University Diploma         | Parents died before age 16 | 0.0346** (0.0198)  | 0.4183           | 0.0820*** (0.0723) |
| MSCE Diploma                   | -                   | 0.1072*** (0.0353) | 0.1618*** (0.0246) | 0.2274*** (0.0763) |

These results illustrate the significant effect of maternal education, particularly when the mother has attained a university degree, on children's likelihood of academic success. The results emphasize the role of a nurturing environment over genetic inheritance in fostering educational attainment  .

## Pased on these findings, several policy recommendations are proposed:
1. **Increase Access to Adult Education**: Providing educational opportunities for parents, particularly mothers, could enhance children's educational outcomes.
2. **Social Support for Single-Parent Families**: Addressing the challenges of children who experience early parental death by offering social support can help mitigate the adverse impacts on educational achievement.
3. **Invest in Health Care Services**: Improved healthcare can reduce premature parental mortality, ensuring that children benefit from parental guidance during critical developmental years.

## Limitations and Future Research
While this study provides valuable insights, certain limitations remain. For instance, the sample size may not capture the full diversity of experiences across Malawi, limiting the generalizability of the results. Additionally, the study focuses solely on parental education, potentially overlooking other mediating factors such as school quality and peer influences. Future research could explore these aspects and use longitudinal data to capture the long-term impact of parental education on life outcomes like employment and health.

## Conclusion
This study demonstrates that parental education, particularly maternal education, has a significant positive impact on children's educational outcomes in Malawi. These findings underscore the importance of policies and interventions aimed at supporting parental education to improve academic success for future generations.

---

## References
Please refer to the full thesis document for a complete list of references used in this study.

---

This project offers critical insights into the role of parental education in shaping children's educational achievements, particularly within the socio-economic context of Malawi.
