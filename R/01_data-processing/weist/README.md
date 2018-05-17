
# Weist Corpus

#### Number of transcripts:

  - Raw = 183
      - Untranscribed = 3
      - Mismarked ‘role’ = 28
  - Filtered = 99

#### Transcripts removed:

  - Those where the child fell outside of the age range of 36-96 months

#### Number of utterances:

  - Raw = 46,766
  - Filtered = 24,863
  - Processed = 24,539

#### Number of tokens & types:

  - Tokens = 116,390
  - Types = 4,162
  - Type-Token Ratio = 0.0357591

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

Weist

</td>

<td style="text-align:left;">

i

</td>

<td style="text-align:right;">

5936

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

Weist

</td>

<td style="text-align:left;">

the

</td>

<td style="text-align:right;">

3327

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

Weist

</td>

<td style="text-align:left;">

it

</td>

<td style="text-align:right;">

3093

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

Weist

</td>

<td style="text-align:left;">

s

</td>

<td style="text-align:right;">

3050

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

Weist

</td>

<td style="text-align:left;">

yeah

</td>

<td style="text-align:right;">

3037

</td>

</tr>

</tbody>

</table>

#### <span style="color:red">Note\!</span>

For 28 of the 183 raw transcripts, the ‘role’ of the target child is
marked as ‘Child’, rather than the expected ‘Target\_Child’. Because of
this, information about the target child’s age, sex, and id are marked
as ‘NA’. To remedy this, ‘Child’ is included in as an option for ‘role’
in `get_utterances()`, in `01_weist_get-utterances.R`. The missing
values were then reconstructed in `01_weist_filter-transcripts.R`. The
reconstructed ages did not take into account days, only months and
years.

Also, 3 of the transcript files did not have a transcription attached to
them and were subsequently removed during the filtering step.
