
# MacWhinney Corpus

#### Number of transcripts:

  - Raw = 288
      - Contain two target children (see note) = 108
  - Filtered = 120

#### Transcripts removed:

  - One file that was a handwritten diary
  - Those where the child fell outside of the age range of 36-96 months

#### Number of utterances:

  - Raw = 53,634
  - Filtered = 19,637
  - Processed = 19,395

#### Number of tokens & types:

  - Tokens = 105,353
  - Types = 4,325
  - Type-Token Ratio = 0.0410525

#### Top five most frequent tokens:

<table>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

db\_version

</th>

<th style="text-align:left;">

collection

</th>

<th style="text-align:left;">

corpus

</th>

<th style="text-align:left;">

word

</th>

<th style="text-align:right;">

n

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

1

</td>

<td style="text-align:right;">

2018.1

</td>

<td style="text-align:left;">

Eng-NA

</td>

<td style="text-align:left;">

MacWhinney

</td>

<td style="text-align:left;">

i

</td>

<td style="text-align:right;">

4864

</td>

</tr>

<tr>

<td style="text-align:left;">

2

</td>

<td style="text-align:right;">

2018.1

</td>

<td style="text-align:left;">

Eng-NA

</td>

<td style="text-align:left;">

MacWhinney

</td>

<td style="text-align:left;">

and

</td>

<td style="text-align:right;">

3569

</td>

</tr>

<tr>

<td style="text-align:left;">

3

</td>

<td style="text-align:right;">

2018.1

</td>

<td style="text-align:left;">

Eng-NA

</td>

<td style="text-align:left;">

MacWhinney

</td>

<td style="text-align:left;">

the

</td>

<td style="text-align:right;">

3263

</td>

</tr>

<tr>

<td style="text-align:left;">

4

</td>

<td style="text-align:right;">

2018.1

</td>

<td style="text-align:left;">

Eng-NA

</td>

<td style="text-align:left;">

MacWhinney

</td>

<td style="text-align:left;">

you

</td>

<td style="text-align:right;">

3030

</td>

</tr>

<tr>

<td style="text-align:left;">

5

</td>

<td style="text-align:right;">

2018.1

</td>

<td style="text-align:left;">

Eng-NA

</td>

<td style="text-align:left;">

MacWhinney

</td>

<td style="text-align:left;">

to

</td>

<td style="text-align:right;">

2282

</td>

</tr>

</tbody>

</table>

#### <span style="color:red">Note\!</span>

When there are two target children in a sample, the `target_child_name`,
`target_child_sex`, `target_child_age`, and `target_child_id` variables
default to `NA`. The name of the child speaking is tracked in the
`speaker_name` variable, but the age, sex, or id of the child speaking
is *not* tracked. These transcripts are removed during the
`02_macwhinney_filter-transcripts.R` when filtering for matches to the
age range criterion.
