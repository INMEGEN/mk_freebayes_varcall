<variantcallestimator.mk

VARIANTCALLESTIMATOR=`{find -L data/ -name '*.bam' \
	|sed -e 's#data/#results/#g' \
		-e 's#.sam#.vcf#g' \
}

variantcallestimator:V:	$VARIANTCALLESTIMATOR

results/%.vcf:	data/%.bam
	mkdir -p `dirname $target`
	freebayes \
		--fasta-reference $FASTA_REFERENCE \
		$prereq \
		> $target

