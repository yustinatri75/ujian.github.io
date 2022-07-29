<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterUjianJawaban
 * 
 * @property int $id
 * @property int|null $soal_id
 * @property string|null $jawaban
 * @property int|null $score
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class MasterUjianJawaban extends Model
{
	protected $table = 'master_ujian_jawaban';

	protected $casts = [
		'soal_id' => 'int',
		'score' => 'int'
	];

	protected $fillable = [
		'soal_id',
		'jawaban',
		'score'
	];
}
