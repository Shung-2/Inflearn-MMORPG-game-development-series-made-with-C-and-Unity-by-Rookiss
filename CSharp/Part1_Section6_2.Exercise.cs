﻿using System;
using System.Collections.Generic;
using System.Text;

namespace CSharp
{
    class Part1_Section6_2
    {

        static int GetHighestScore(int[] scores)
        {
            int maxValue = 0;

            foreach (int score in scores)
            {
                if (score > maxValue)
                {
                    maxValue = score;
                }
            }
            return maxValue;
        }

        static int GetAverageScore(int[] scores)
        {
            if (scores.Length == 0)
                return 0;

            int sum = 0;

            foreach(int score in scores)
            {
                sum += score;
            }

            return sum / scores.Length;
        }

        static int GetIndexOf(int[] scores, int value)
        {
            for (int i = 0; i <scores.Length; i++)
            {
                if (scores[i] == value)
                {
                    return i;
                }
            }
            return -1;
        }

        static void Sort(int[] scores)
        {
            for (int i = 0; i < scores.Length; i++)
            {
                // [i ~ scores.Length - 1] 범위에서 제일 작은 숫자가 있는 index를 찾는다.
                int minIndex = i;
                for (int j = i;  i< scores.Length; j++)
                {
                    if (scores[i] < scores[minIndex])
                        minIndex = j;
                }

                // swap
                int temp = scores[i];
                scores[i] = scores[minIndex];
                scores[minIndex] = temp;
            }
        }

        static void Main (string[] args)
        {
            // 배열
            int[] scores = new int[5] { 10, 30, 40, 20, 50 };
            int highestScore = GetHighestScore(scores);
            Console.WriteLine(highestScore);

            int averageScore = GetAverageScore(scores);
            Console.WriteLine(averageScore);

            int index = GetIndexOf(scores, 20);
            Console.WriteLine(index);

            Sort(scores);

        }
    }
}
